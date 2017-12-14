package com.game.logserver.utils;

import java.lang.annotation.Annotation;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * 类工具
 * 
 * @author hjj2017
 * @since 2013/7/22
 * 
 */
public final class ClazzUtil {
	/**
	 * 类默认构造器
	 * 
	 */
	private ClazzUtil() {
	}

	/**
	 * 列表类成员, 包括函数和字段
	 * 
	 * @param objClazz
	 * @return 
	 * 
	 */
	public static List<Member> listMembers(Class<?> objClazz) {
		if (objClazz == null) {
			return null;
		}

		// 类集成关系堆栈
		LinkedList<Class<?>> clazzStack = new LinkedList<>();
		// 当前类
		Class<?> currClazz;

		for (currClazz = objClazz; 
			 currClazz != null; 
			 currClazz = currClazz.getSuperclass()) {
			// 将当前类压入堆栈
			clazzStack.offerFirst(currClazz);
		}

		// 创建方法列表
		List<Member> ml = new ArrayList<>();

		while ((currClazz = clazzStack.pollFirst()) != null) {
			// 获取方法数组
			Member[] mArr = currClazz.getDeclaredMethods();

			for (Member m : mArr) {
				// 添加方法对象到列表
				ml.add(m);
			}

			// 获取字段数组
			mArr = currClazz.getDeclaredFields();

			for (Member m : mArr) {
				// 添加方法对象到列表
				ml.add(m);
			}
		}

		return ml;
	}

	/**
	 * 列表带有指定注解的 get 方法
	 * 
	 * @param objClazz
	 * @param hasAnnotation
	 * @return 
	 * 
	 */
	public static <T extends Annotation> List<Member> listMembers(Class<?> objClazz, Class<T> hasAnnotation) {
		// 列表类方法
		List<Member> ml = listMembers(objClazz);

		if (ml == null || 
			ml.isEmpty()) {
			return null;
		}

		// 创建结果列表
		List<Member> resultList = new ArrayList<>(ml.size());

		for (Member m : ml) {
			// 获取注解
			T $annoObj = null;

			if (m instanceof AccessibleObject) {
				// 获取注解
				$annoObj = ((AccessibleObject)m).getAnnotation(hasAnnotation);
			}
	
			if ($annoObj == null) {
				// 如果注解对象为空, 
				// 则直接跳过!
				continue;
			}

			// 添加方法对象到结果列表
			resultList.add(m);
		}

		return resultList;
	}

	/**
	 * 获取定义或返回类型
	 * 
	 * @param $m
	 * @return 
	 * 
	 */
	public static Class<?> getDefOrRetType(Member $m) {
		// 获取返回值类型
		Class<?> typeClazz = null;

		if ($m instanceof Field) {
			// 如果是字段, 
			// 则获取定义类型
			typeClazz = ((Field)$m).getType();
		} else 
		if ($m instanceof Method) {
			// 如果是函数, 
			// 则获取返回类型
			typeClazz = ((Method)$m).getReturnType();
		}

		return typeClazz;
	}

	/**
	 * 是否为 get 方法 ?
	 * 
	 * @param m
	 * @return 
	 * 
	 */
	public static boolean isGetter(Member m) {
		return ((m != null) && 
			(m instanceof Method) && 
			(m.getName().startsWith("get") || m.getName().startsWith("is"))
		);
	}
}
