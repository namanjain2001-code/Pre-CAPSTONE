package com.findshow;


import static org.assertj.core.api.Assertions.assertThat;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
//import org.mockito.junit.runner.MockitoJUnitRunner;
import org.mockito.*;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FindShowApplicationTest {

	@Before
	public  void setUp() throws Exception {
		
	}

	@BeforeClass
	public  static void setUpBeforeClass() throws Exception {
		
	}

	@After
	public  void tearDown() throws Exception {
		
	}

	@AfterClass
	public  static void tearDownAfterClass() throws Exception {
		
	}

	@Test
	public  void testMain() throws Exception {
		// given
		String[] args = new String[]{"TestArgs"};
		// when
		FindShowApplication.main(args);
		// then
		// TODO check for expected side effect (i.e. service call, changed parameter or exception thrown)
		// verify(mock).methodcall();
		// TestUtils.assertTestFileEquals("someMethod/ParamType_updated.json", TestUtils.objectToJson(param));
		// assertThrows(SomeException.class, () -> underTest.someMethod());
	}

}