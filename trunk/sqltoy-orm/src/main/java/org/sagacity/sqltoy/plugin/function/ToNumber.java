/**
 * 
 */
package org.sagacity.sqltoy.plugin.function;

import org.sagacity.sqltoy.plugin.IFunction;

/**
 * @project sqltoy-orm
 * @description 数字转换
 * @author renfei.chen <a href="mailto:zhongxuchen@gmail.com">联系作者</a>
 * @version id:ToNumber.java,Revision:v1.0,Date:2013-1-2
 */
public class ToNumber extends IFunction {
	/*
	 * (non-Javadoc)
	 * 
	 * @see org.sagacity.sqltoy.config.function.IFunction#regex()
	 */
	@Override
	public String regex() {
		return "(?i)\\Wto\\_number\\(";
	}

	public String dialects() {
		return "db2,oracle12c";
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.sagacity.sqltoy.config.function.IFunction#wrap(java.lang.String
	 * [])
	 */
	@Override
	public String wrap(int dialect, String functionName, boolean hasArgs,
			String... args) {
		return null;
	}
}
