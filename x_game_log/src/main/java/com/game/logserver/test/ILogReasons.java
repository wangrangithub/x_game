package com.game.logserver.test;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

public interface ILogReasons {
	@Documented
	@Retention(RetentionPolicy.RUNTIME)
	@Target({ ElementType.FIELD, ElementType.TYPE })
	public @interface ReasonDesc {
		/**
		 * 原因的文字描述
		 * 
		 * @return
		 */
		String value();
	}

	@Documented
	@Retention(RetentionPolicy.RUNTIME)
	@Target({ ElementType.FIELD, ElementType.TYPE })
	public @interface LogDesc {
		/**
		 * 日志描述
		 * 
		 * @return
		 */
		String desc();
	}

	/**
	 * LogReason的通用接口
	 */
	public static interface ILogReason {
		/**
		 * 取得原因的序号
		 * 
		 * @return
		 */
		public int getReason();

		/**
		 * 获取原因的文本
		 * 
		 * @return
		 */
		public String getReasonText();
	}
	
	@LogDesc(desc = "物品日志")
	public enum ItemLogReason implements ILogReason {
		@ReasonDesc("加载角色物品时数据错误")
		ITEM_LOG_1(1, "物品日志{0}"),
		@ReasonDesc("装备强化")
		ITEM_LOG_2(2, "装备强化{1}"),;

		/** 原因序号 */
		public final int reason;
		/** 原因文本 */
		public final String reasonText;

		private ItemLogReason(int reason, String reasonText) {
			this.reason = reason;
			this.reasonText = reasonText;
		}

		@Override
		public int getReason() {
			return reason;
		}

		@Override
		public String getReasonText() {
			return reasonText;
		}
	}
}
