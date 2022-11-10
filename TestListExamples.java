import static org.junit.Assert.*;
import org.junit.*;
import java.util.*;


public class TestListExamples {
  // Write your grading tests here!
  ListExamples newStudentExample = new ListExamples();

  @Test
  public void testMerge2ListsInOrder(){
    List<String> list1 = new ArrayList<>(Arrays.asList("a","b","c"));

    List<String> list2 = new ArrayList<>(Arrays.asList("d","e", "f"));

    List<String> result = newStudentExample.merge(list1,list2);
    
    List<String> expected =  new ArrayList<>(Arrays.asList("a","b","c","d","e", "f"));
    assertEquals(expected,result);
  }

  @Test
  public void testMerge2ListsOutOfOrder(){
    List<String> list1 = new ArrayList<>(Arrays.asList("a","c","e"));

    List<String> list2 = new ArrayList<>(Arrays.asList("b","d", "f"));

    List<String> result = newStudentExample.merge(list1,list2);
    
    List<String> expected =  new ArrayList<>(Arrays.asList("a","b","c","d","e", "f"));
    assertEquals(expected,result);
  }

  @Test
  public void testMergeListsDuplicateReferenceItems(){
    String a = "a";
    List<String> list1 = new ArrayList<>(Arrays.asList("a","b","c"));

    List<String> list2 = new ArrayList<>(Arrays.asList(a,"d", "e"));

    List<String> result = newStudentExample.merge(list1,list2);
    
    List<String> expected =  new ArrayList<>(Arrays.asList("a",a,"b","c","d","e"));
    assertEquals(expected,result);
  }









}
