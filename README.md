# Задание 2 по Hadoop.

Слова считаем равными с точностью до перестановки букв (abc=bca). Найдите наиболее популярные перестановки, также посчитайте число исходных слов в каждой перестановке. Т.е. если ‘abc’ встретилось 50 раз и ‘bca’ 50 и других слов из этих букв не было, то в результате будет: abc 100 2.
Отсортируйте результат по убыванию популярности перестановки (по 2-му полю), с одинаковой популярностью – лексикографически. Исходные данные очищайте от знаков пунктуации и приводите к нижнему регистру. Фильтруйте слова короче 3х символов.

- Входные данные: википедия.
- Формат вывода: перестановка сколько раз встретилась число исходных слов (уникальных).
- Вывод на печать: топ10 перестановок.

Пример вывода:
<pre>
for         91296   6
ahtt        81580   2
hitw        79582   2
</pre>

Решение надо выполнить на Hadoop Streaming. При решении задач старайтесь использовать оптимальный MapReduce-алгоритм:

- использовать как можно меньшее кол-во Hadoop Job,
- использовать больше, чем 1 reducer (1 reducer разрешается использовать только в финальной job'е, при сортировке результата).

### Входные данные
Википедия:
Путь на кластере: /data/wiki/en_articles, семпл: /data/wiki/en_articles_part

Формат: текст, в каждой строке:
идентификатор статьи <tab> текст статьи.
