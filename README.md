📝 中文简介：
信息来自网络，自己通过python进行整理
本项目提供了一套中国至美国格式的中英文地址信息数据库，包括省、市、区的标准中英文名称、拼音、邮编、坐标等信息，适用于：

🌍 跨境电商地址标准化

🛫 国际物流单据生成

🧾 中英文地址转换/翻译工具

📦 快递打印系统集成

📊 地理信息系统（GIS）数据支持

本数据库支持SQL 导入，并提供多种使用方案选单，方便开发者、运营人员以及物流行业用户灵活调用。

📦 数据结构示意：
provinces：省份中英文名称、拼音、编码；

cities：城市中英文、所属省份、坐标信息；

districts：区/县中英文、邮编、所属城市。

✅ 支持方式：
SQL 文件下载；

JSON / CSV 格式可选；

graphql API 接入（开发中）；

在线查询工具（计划中）。 如有需要可以留言



📝 English Introduction:
This project provides a comprehensive China-to-American-format bilingual address database, including standardized Chinese and English names of provinces, cities, and districts, along with pinyin, postal codes, and coordinates. It is ideal for:

🌍 Cross-border e-commerce address standardization

🛫 International shipping and logistics document generation

🧾 Address translation and conversion tools

📦 Integration with shipping label printing systems

📊 GIS (Geographic Information System) data enrichment

The database is available via SQL import and offers multiple usage modes to suit developers, operations, and logistics service providers.

📦 Data Structure Overview:
provinces: Province names in Chinese/English, pinyin, code

cities: City names, province linkage, coordinates

districts: District names, city linkage, postal codes

✅ Access Options:
SQL file download

JSON / CSV formats

RESTful API (in progress)

Online address lookup tool (coming soon)
```
#使用教程  User Manual 
-- 示例：查找“广东省”下的所有市
--Find all the cities under "Guangdong Province
SELECT id, name, name_en, admin_code 
FROM address 
WHERE parent_id = (SELECT id FROM address WHERE name = '广东省');
-- 示例：查找“南山区”的完整路径
-- Example: Find the full - path of "Nanshan District
SELECT
    district.name AS '区',
    city.name AS '市',
    province.name AS '省'
FROM
    address AS district
LEFT JOIN 
    address AS city ON district.parent_id = city.id
LEFT JOIN 
    address AS province ON city.parent_id = province.id
WHERE
    district.name = '南山区';

-- 示例：查找“California”州下的所有县和市
-- Example: Find all the counties and cities under the state of "California"
WITH RECURSIVE address_tree AS (
    -- 初始部分：找到顶级节点 (California)
    SELECT * FROM address WHERE name_en = 'California'
    UNION ALL
    -- 递归部分：找到所有子节点
    SELECT child.* FROM address AS child
    JOIN address_tree AS parent ON child.parent_id = parent.id
)
SELECT * FROM address_tree WHERE name_en != 'California';
```


    

