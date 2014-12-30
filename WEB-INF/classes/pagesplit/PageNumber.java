package pagesplit;

public class PageNumber
{
  int rowCount = 1; int pageSize = 1; int showPage = 1; int pageCount = 1;

  public void setRowCount(int paramInt)
  {
    this.rowCount = paramInt;
  }

  public int getRowCount() {
    return this.rowCount;
  }

  public void setPageCount(int paramInt1, int paramInt2) {
    this.rowCount = paramInt1;
    this.pageSize = paramInt2;
    int i = this.rowCount % this.pageSize == 0 ? this.rowCount / this.pageSize : this.rowCount / this.pageSize + 1;
    this.pageCount = i;
  }

  public int getPageCount() {
    return this.pageCount;
  }

  public void setShowPage(int paramInt) {
    this.showPage = paramInt;
  }

  public int getShowPage() {
    return this.showPage;
  }

  public void setPageSize(int paramInt) {
    this.pageSize = paramInt;
  }

  public int getPageSize() {
    return this.pageSize;
  }
}