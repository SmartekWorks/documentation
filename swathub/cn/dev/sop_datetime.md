日期时间
===

提供针对日期的格式化和解析操作，以及关于日期和时间的各种计算。

日期格式化
---

此操作可以将一个日期对象，格式化成自定义的字符串。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| 日期变量   | （可选）日期变量名，例如，`dateObj`。默认值为表示当前时间的日期变量。变量类型支持JavaScript的Date对象，或者[Day.js类型的对象](https://github.com/iamkun/dayjs/)。
| 格式   | （可选）自定义的日期格式。默认值为 `YYYY-MM-DD HH:mm:ss`。参考[日期格式](https://day.js.org/docs/en/display/format)。

#### 输出结果
日期字符串。

日期解析
---

此操作可以从一个自定义的字符串，解析为一个日期对象。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| 文本   | （可选）日期字符串，例如，`2020-10-12 12:00:00`。默认值为表示当前时间的日期字符串。
| 格式   | （可选）自定义的日期格式。默认值为 `YYYY-MM-DD HH:mm:ss`。参考[日期格式](https://day.js.org/docs/en/display/format)。

#### 输出结果
[Day.js类型的对象](https://github.com/iamkun/dayjs/)。

Day.js类型的对象支持多种日期和时间的计算方式，如下所示，假设对象名为`dateObj`：

```javascript
  dateObj.add(1, 'day') // 加一天
  dateObj.subtract(1, 'week') // 减一周
  dateObj.startOf('month') // 本月第一天
  dateObj1.diff(dateObj2, 'day') // 两个日期相差的天数
```