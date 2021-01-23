function get_query_for_num(years, tnved, iso3, eximtype, limit_begin, limit_len){
    // years = [2017, 2018, 2019];
    // tnved = "011034";
    // iso3 = "RUS";
    // eximtype = "ex" || "im";
    // limit_begin = 0; // begining number of LIMIT 0, 50
    // limit_len = 50; // length of list LIMIT 0, 50

    var st1 = "";
    var st2 = "";
    var st3 = "";
    var quer = ``;

    years.forEach((y, i) => {
        st1 += ", SUM(count_" + y + ") as count_" + y;
        st1 += ", SUM(sum_" + y + ") as sum_" + y;
        st2 += ", (CASE WHEN exim.year_=\"" + y + "\" THEN exim.count_ ELSE 0 END) AS count_" + y;
        st2 += ", (CASE WHEN exim.year_=\"" + y + "\" THEN exim.sum_ ELSE 0 END) AS sum_" + y;
        if(i === 0){
            st3 += "exim.year_=\"" + y + "\"";
        }else{
            st3 += " OR exim.year_=\"" + y + "\"";
        }
    });

    quer = `
        SELECT COUNT(*) as num FROM (
            SELECT tnved, tnvedcodes.name, iso3codes.country, iso3, unit${st1}
            FROM (
                SELECT exim.year_ AS a, exim.tnved AS tnved, exim.iso3 AS iso3, exim.unit AS unit${st2}
                FROM exim 
                WHERE exim.iso3 LIKE "%${iso3}%" 
                AND (exim.tnved LIKE "${tnved}%" OR exim.tnved IN (SELECT id FROM tnvedcodes WHERE tnvedcodes.name LIKE "%${tnved}%")) 
                AND exim.ei="${eximtype}" 
                AND (${st3})
            ) t
            LEFT JOIN iso3codes ON iso3codes.id=iso3
            LEFT JOIN tnvedcodes ON tnvedcodes.id=tnved
            GROUP BY tnved, iso3, unit
            ORDER BY sum_${years[years.length - 1]} DESC
        ) tt
    `;
    return quer;
}

module.exports = get_query_for_num;