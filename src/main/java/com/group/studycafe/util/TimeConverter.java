package com.group.studycafe.util;

public class TimeConverter {
    public static String convertHours(int hours) {
        int weeks = hours / (24 * 7);
        int days = (hours % (24 * 7)) / 24;
        int remainingHours = hours % 24;

        StringBuilder result = new StringBuilder();
        if (weeks > 0) {
            result.append(weeks).append("주 ");
        }
        if (days > 0) {
            result.append(days).append("일 ");
        }
        if (remainingHours > 0) {
            result.append(remainingHours).append("시간");
        }
        return result.toString().trim();
    }
}
