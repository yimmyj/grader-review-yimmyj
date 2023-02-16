import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }

  @Test(timeout = 500)
  public void testTroll() {
    assertEquals(true, true);
  }

  @Test(timeout = 500)
  public void testTroll2() {
    assertEquals(true, true);
  }

  @Test(timeout = 500)
  public void testFreePoints() {
    assertEquals(true, true);
  }

  @Test(timeout = 500)
  public void testFuckYou() {
    assertEquals(false, true);
  }
}
