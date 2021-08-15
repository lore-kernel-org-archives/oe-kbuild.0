Content-Type: multipart/mixed; boundary="===============4776763240160989289=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/opp/core.c:1009:3: warning: Possible null pointer dereference: opp [nullPointer]
Date: Mon, 16 Aug 2021 06:57:04 +0800
Message-ID: <202108160652.mXokIVTU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4776763240160989289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Julian Braha <julianbraha@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Julian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ecf93431963a95c0f475921101bedc0dd62ec96d
commit: 7d37cb2c912dc5c25ffac784a4f9b98c06c6bd08 lib: fix kconfig dependenc=
y on ARCH_WANT_FRAME_POINTERS
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
compiler: csky-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/opp/core.c:1009:3: warning: Possible null pointer dereference: o=
pp [nullPointer]
     opp->level, old_opp->bandwidth ? old_opp->bandwidth[0].peak : 0,
     ^
   drivers/opp/core.c:1085:27: note: Assignment 'opp=3DNULL', assigned valu=
e is 0
    struct dev_pm_opp *opp =3D NULL;
                             ^
   drivers/opp/core.c:1126:33: note: Calling function '_set_opp', 3rd argum=
ent 'opp' value is 0
    ret =3D _set_opp(dev, opp_table, opp, freq);
                                   ^
   drivers/opp/core.c:1009:3: note: Null pointer dereference
     opp->level, old_opp->bandwidth ? old_opp->bandwidth[0].peak : 0,
     ^
   drivers/opp/core.c:1010:3: warning: Possible null pointer dereference: o=
pp [nullPointer]
     opp->bandwidth ? opp->bandwidth[0].peak : 0);
     ^
   drivers/opp/core.c:1085:27: note: Assignment 'opp=3DNULL', assigned valu=
e is 0
    struct dev_pm_opp *opp =3D NULL;
                             ^
   drivers/opp/core.c:1126:33: note: Calling function '_set_opp', 3rd argum=
ent 'opp' value is 0
    ret =3D _set_opp(dev, opp_table, opp, freq);
                                   ^
   drivers/opp/core.c:1010:3: note: Null pointer dereference
     opp->bandwidth ? opp->bandwidth[0].peak : 0);
     ^
>> drivers/opp/core.c:1621:20: warning: Possible null pointer dereference: =
opp2 [nullPointer]
    if (opp1->rate !=3D opp2->rate)
                      ^
   drivers/opp/core.c:1085:27: note: Assignment 'opp=3DNULL', assigned valu=
e is 0
    struct dev_pm_opp *opp =3D NULL;
                             ^
   drivers/opp/core.c:1126:33: note: Calling function '_set_opp', 3rd argum=
ent 'opp' value is 0
    ret =3D _set_opp(dev, opp_table, opp, freq);
                                   ^
   drivers/opp/core.c:1012:43: note: Calling function '_opp_compare_key', 2=
nd argument 'opp' value is 0
    scaling_down =3D _opp_compare_key(old_opp, opp);
                                             ^
   drivers/opp/core.c:1621:20: note: Null pointer dereference
    if (opp1->rate !=3D opp2->rate)
                      ^
   drivers/opp/core.c:1626:21: warning: Possible null pointer dereference: =
opp2 [nullPointer]
    if (opp1->level !=3D opp2->level)
                       ^
   drivers/opp/core.c:1085:27: note: Assignment 'opp=3DNULL', assigned valu=
e is 0
    struct dev_pm_opp *opp =3D NULL;
                             ^
   drivers/opp/core.c:1126:33: note: Calling function '_set_opp', 3rd argum=
ent 'opp' value is 0
    ret =3D _set_opp(dev, opp_table, opp, freq);
                                   ^
   drivers/opp/core.c:1012:43: note: Calling function '_opp_compare_key', 2=
nd argument 'opp' value is 0
    scaling_down =3D _opp_compare_key(old_opp, opp);
                                             ^
   drivers/opp/core.c:1626:21: note: Null pointer dereference
    if (opp1->level !=3D opp2->level)
                       ^
>> drivers/opp/core.c:1649:4: warning: Address of local auto-variable assig=
ned to a function parameter. [autoVariables]
      *head =3D &opp->node;
      ^

vim +1009 drivers/opp/core.c

f3364e17d5716a drivers/opp/core.c            Viresh Kumar    2020-08-13   9=
84  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21   9=
85  static int _set_opp(struct device *dev, struct opp_table *opp_table,
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21   9=
86  		    struct dev_pm_opp *opp, unsigned long freq)
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09   9=
87  {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21   9=
88  	struct dev_pm_opp *old_opp;
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21   9=
89  	int scaling_down, ret;
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09   9=
90  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21   9=
91  	if (unlikely(!opp))
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21   9=
92  		return _disable_opp_table(dev, opp_table);
aca48b61f96386 drivers/opp/core.c            Rajendra Nayak  2020-04-08   9=
93  =

81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20   9=
94  	/* Find the currently set OPP if we don't know already */
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20   9=
95  	if (unlikely(!opp_table->current_opp))
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20   9=
96  		_find_current_opp(dev, opp_table);
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09   9=
97  =

81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20   9=
98  	old_opp =3D opp_table->current_opp;
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20   9=
99  =

81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
00  	/* Return early if nothing to do */
de04241ab87afc drivers/opp/core.c            Jonathan Marek  2021-02-16  10=
01  	if (old_opp =3D=3D opp && opp_table->current_rate =3D=3D freq &&
de04241ab87afc drivers/opp/core.c            Jonathan Marek  2021-02-16  10=
02  	    opp_table->enabled) {
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
03  		dev_dbg(dev, "%s: OPPs are same, nothing to do\n", __func__);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
04  		return 0;
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  10=
05  	}
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  10=
06  =

f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
07  	dev_dbg(dev, "%s: switching OPP: Freq %lu -> %lu Hz, Level %u -> %u, B=
w %u -> %u\n",
de04241ab87afc drivers/opp/core.c            Jonathan Marek  2021-02-16  10=
08  		__func__, opp_table->current_rate, freq, old_opp->level,
de04241ab87afc drivers/opp/core.c            Jonathan Marek  2021-02-16 @10=
09  		opp->level, old_opp->bandwidth ? old_opp->bandwidth[0].peak : 0,
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
10  		opp->bandwidth ? opp->bandwidth[0].peak : 0);
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
11  =

f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
12  	scaling_down =3D _opp_compare_key(old_opp, opp);
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
13  	if (scaling_down =3D=3D -1)
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
14  		scaling_down =3D 0;
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  10=
15  =

ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar    2018-06-14  10=
16  	/* Scaling up? Configure required OPPs before frequency */
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
17  	if (!scaling_down) {
2c59138c22f17c drivers/opp/core.c            Stephan Gerhold 2020-07-30  10=
18  		ret =3D _set_required_opps(dev, opp_table, opp, true);
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
19  		if (ret) {
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
20  			dev_err(dev, "Failed to set required opps: %d\n", ret);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
21  			return ret;
ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar    2018-06-14  10=
22  		}
ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar    2018-06-14  10=
23  =

870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
24  		ret =3D _set_opp_bw(opp_table, opp, dev);
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
25  		if (ret) {
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
26  			dev_err(dev, "Failed to set bw: %d\n", ret);
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
27  			return ret;
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
28  		}
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
29  	}
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
30  =

7e535993fa4f67 drivers/opp/core.c            Viresh Kumar    2018-06-12  10=
31  	if (opp_table->set_opp) {
509e4777ca41d3 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
32  		ret =3D _set_opp_custom(opp_table, dev, opp, freq);
7e535993fa4f67 drivers/opp/core.c            Viresh Kumar    2018-06-12  10=
33  	} else if (opp_table->regulators) {
3f62670fcca4af drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
34  		ret =3D _generic_set_opp_regulator(opp_table, dev, opp, freq,
3f62670fcca4af drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
35  						 scaling_down);
c74b32fadc00f2 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  10=
36  	} else {
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  10=
37  		/* Only frequency scaling */
1d3c42cabbd351 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
38  		ret =3D _generic_set_opp_clk_only(dev, opp_table->clk, freq);
c74b32fadc00f2 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  10=
39  	}
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  10=
40  =

870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
41  	if (ret)
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
42  		return ret;
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
43  =

ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar    2018-06-14  10=
44  	/* Scaling down? Configure required OPPs after frequency */
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
45  	if (scaling_down) {
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
46  		ret =3D _set_opp_bw(opp_table, opp, dev);
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
47  		if (ret) {
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
48  			dev_err(dev, "Failed to set bw: %d\n", ret);
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
49  			return ret;
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
50  		}
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
51  =

2c59138c22f17c drivers/opp/core.c            Stephan Gerhold 2020-07-30  10=
52  		ret =3D _set_required_opps(dev, opp_table, opp, false);
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
53  		if (ret) {
ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar    2018-06-14  10=
54  			dev_err(dev, "Failed to set required opps: %d\n", ret);
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
55  			return ret;
870d5d963972dd drivers/opp/core.c            Viresh Kumar    2021-01-28  10=
56  		}
c74b32fadc00f2 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  10=
57  	}
052c6f19141dd1 drivers/base/power/opp/core.c Viresh Kumar    2017-01-23  10=
58  =

72f80ce4ef9b75 drivers/opp/core.c            Viresh Kumar    2020-08-13  10=
59  	opp_table->enabled =3D true;
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
60  	dev_pm_opp_put(old_opp);
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
61  =

81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
62  	/* Make sure current_opp doesn't get freed */
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
63  	dev_pm_opp_get(opp);
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
64  	opp_table->current_opp =3D opp;
de04241ab87afc drivers/opp/core.c            Jonathan Marek  2021-02-16  10=
65  	opp_table->current_rate =3D freq;
fe2af40250bfc3 drivers/opp/core.c            Georgi Djakov   2020-05-12  10=
66  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
67  	return ret;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
68  }
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
69  =


:::::: The code at line 1009 was first introduced by commit
:::::: de04241ab87afcaac26f15fcc32a7bd27294dd47 opp: Don't skip freq update=
 for different frequency

:::::: TO: Jonathan Marek <jonathan@marek.ca>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4776763240160989289==--

