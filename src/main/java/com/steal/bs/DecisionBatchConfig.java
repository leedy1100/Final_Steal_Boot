package com.steal.bs;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.support.SimpleJobLauncher;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.core.repository.support.JobRepositoryFactoryBean;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.item.database.JdbcBatchItemWriter;
import org.springframework.batch.item.database.JdbcCursorItemReader;
import org.springframework.batch.item.database.builder.JdbcBatchItemWriterBuilder;
import org.springframework.batch.item.database.builder.JdbcCursorItemReaderBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.steal.bs.model.DocumentAlertDto;

@Configuration
public class DecisionBatchConfig {
	@Autowired
	private JobBuilderFactory jobFactory;
	@Autowired
	private StepBuilderFactory stepFactory;
	
	// JOB
	@Bean
	public Job job(Step step) {
		// get("") 으로 job 이름 설정
		// start : step을 시작함
		return jobFactory.get("simpleJob")
				.start(step)
				.build();
	}
	
	// STEP
	@Bean
	public Step step() {
		/*
		return stepFactory.get("simpleStep").allowStartIfComplete(true)
				.tasklet(tasklet).build();
		*/
		// allowStartIfComplete(true) : step이 complete 된 상태라도 재실행이 가능하도록 설정
		// <testDto, testDto>chunk(3) : <testDto, testDto> 에서 첫번째 dto는 Reader에서 반환할 타입이고,
		//								두번째 dto는 Writer에 파라미터로 넘어올 타입
		//								chunk(3)은 Reader & Writer가 묶일 트랜잭션 범위
		return stepFactory.get("simpleStep").allowStartIfComplete(true)
				.<DocumentAlertDto, DocumentAlertDto>chunk(2).reader(jdbcCursorItemReader())
				.writer(jdbcBatchItemWriter()).build();
	}
	
	// ItemReader
	@Bean
	public JdbcCursorItemReader<DocumentAlertDto> jdbcCursorItemReader() {
		// fetchSize : Database에서 한번에 가져올 데이터 양을 나타냄
		// rowMapper : Resultset을 testDto로 매핑하기 위한 Mapper
		JdbcCursorItemReaderBuilder<DocumentAlertDto> reader = new JdbcCursorItemReaderBuilder<DocumentAlertDto>();
		reader.fetchSize(3)
		.dataSource(myDataSource())
		.rowMapper(new BeanPropertyRowMapper<>(DocumentAlertDto.class))
		.sql("SELECT TITLE, WRITER, DEADLINE FROM DOCSETTLE WHERE DEADLINE < TO_CHAR(SYSDATE+7,'YYYYMMDD')")
		.name("jdbcCursorItemReader");
		return reader.build();
		/*
		return new JdbcCursorItemReaderBuilder<testDto>()
				.fetchSize(3)
				.dataSource(myDataSource())
				.rowMapper(new BeanPropertyRowMapper<testDto>(testDto.class))
				.sql("SELECT MYNO, MYNAME, MYTITLE, MYCONTENT, MYDATE FROM MYBOARD")
				.name("jdbcCursorItemReader").build();
		*/
	}
	
	// ItemWriter
	/*
	public ItemWriter<testDto> itemWriter() {
		return new ItemWriter<testDto>() {
			@Override
			public void write(List<? extends testDto> items) throws Exception {
				for(testDto dto : items) {
					System.out.println(dto.getMyname());
				}
			}
		};
	}
	*/
	@Bean
	public JdbcBatchItemWriter<DocumentAlertDto> jdbcBatchItemWriter() {
		return new JdbcBatchItemWriterBuilder<DocumentAlertDto>()
				.dataSource(myDataSource())
				.sql("INSERT INTO ALERT VALUES (ALERTSEQ.NEXTVAL, :title, :writer, :deadline)")
				.beanMapped()
				.build();
	}
	
	// DataSource
	@Bean
	public BasicDataSource myDataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		source.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		source.setUsername("kh");
		source.setPassword("kh");
		return source;
	}
	
	// JobLauncher
	@Bean
	public SimpleJobLauncher myJobLauncher(DataSourceTransactionManager myTransactionManager, DataSource dataSource) throws Exception {
		SimpleJobLauncher jobLauncher = new SimpleJobLauncher();
		jobLauncher.setJobRepository(myJobRepository());
		return jobLauncher;
	}
	
	// JobRepository
	@Bean
	public JobRepository myJobRepository() throws Exception {
		JobRepositoryFactoryBean repository = new JobRepositoryFactoryBean();
		repository.setDatabaseType("Oracle");
		repository.setDataSource(myDataSource());
		repository.setTransactionManager(myTransactionManager());
		return repository.getObject();
	}
	
	// TransactionManager
	@Bean
	public DataSourceTransactionManager myTransactionManager() {
		return new DataSourceTransactionManager(myDataSource());
	}
	
	// sqlSessionFactory
	@Bean(name = "sqlSessionFactory")
	public SqlSessionFactory sqlSessionFactory(DataSource datasource) throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(datasource);
		factoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:/mappers/*.xml"));
		factoryBean.setTypeAliasesPackage("com.steal.bs.*");
		return factoryBean.getObject();
	}
	
	// sqlSession
	@Bean(name = "sqlSession")
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
	
	@Bean
    public PasswordEncoder passwordEncoder() {
    	return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

}


























