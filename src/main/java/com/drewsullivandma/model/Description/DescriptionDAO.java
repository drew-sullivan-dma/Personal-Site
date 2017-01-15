package com.drewsullivandma.model.Description;

import java.util.List;

public interface DescriptionDAO {

	public List<Description> getAllDescriptionsByBookId(int id);
}
