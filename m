Content-Type: multipart/mixed; boundary="===============1566548326034847415=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/opp/core.c:1025:45: warning: Possible null pointer dereference: opp [nullPointer]
Date: Sat, 13 Nov 2021 19:55:33 +0800
Message-ID: <202111131913.IJglDzlB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1566548326034847415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   66f4beaa6c1d28161f534471484b2daa2de1dce0
commit: f0b88fa45595254fa51427bd8ca321732e2eb73d opp: Allow _set_opp() to w=
ork for non-freq devices
date:   9 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 9 months ago
compiler: h8300-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/opp/core.c:1025:45: warning: Possible null pointer dereference: =
opp [nullPointer]
     __func__, old_freq, freq, old_opp->level, opp->level,
                                               ^
   drivers/opp/core.c:1089:27: note: Assignment 'opp=3DNULL', assigned valu=
e is 0
    struct dev_pm_opp *opp =3D NULL;
                             ^
   drivers/opp/core.c:1130:33: note: Calling function '_set_opp', 3rd argum=
ent 'opp' value is 0
    ret =3D _set_opp(dev, opp_table, opp, freq);
                                   ^
   drivers/opp/core.c:1025:45: note: Null pointer dereference
     __func__, old_freq, freq, old_opp->level, opp->level,
                                               ^
   drivers/opp/core.c:1027:3: warning: Possible null pointer dereference: o=
pp [nullPointer]
     opp->bandwidth ? opp->bandwidth[0].peak : 0);
     ^
   drivers/opp/core.c:1089:27: note: Assignment 'opp=3DNULL', assigned valu=
e is 0
    struct dev_pm_opp *opp =3D NULL;
                             ^
   drivers/opp/core.c:1130:33: note: Calling function '_set_opp', 3rd argum=
ent 'opp' value is 0
    ret =3D _set_opp(dev, opp_table, opp, freq);
                                   ^
   drivers/opp/core.c:1027:3: note: Null pointer dereference
     opp->bandwidth ? opp->bandwidth[0].peak : 0);
     ^
>> drivers/opp/core.c:1590:20: warning: Possible null pointer dereference: =
opp2 [nullPointer]
    if (opp1->rate !=3D opp2->rate)
                      ^
   drivers/opp/core.c:1089:27: note: Assignment 'opp=3DNULL', assigned valu=
e is 0
    struct dev_pm_opp *opp =3D NULL;
                             ^
   drivers/opp/core.c:1130:33: note: Calling function '_set_opp', 3rd argum=
ent 'opp' value is 0
    ret =3D _set_opp(dev, opp_table, opp, freq);
                                   ^
   drivers/opp/core.c:1029:43: note: Calling function '_opp_compare_key', 2=
nd argument 'opp' value is 0
    scaling_down =3D _opp_compare_key(old_opp, opp);
                                             ^
   drivers/opp/core.c:1590:20: note: Null pointer dereference
    if (opp1->rate !=3D opp2->rate)
                      ^
   drivers/opp/core.c:1595:21: warning: Possible null pointer dereference: =
opp2 [nullPointer]
    if (opp1->level !=3D opp2->level)
                       ^
   drivers/opp/core.c:1089:27: note: Assignment 'opp=3DNULL', assigned valu=
e is 0
    struct dev_pm_opp *opp =3D NULL;
                             ^
   drivers/opp/core.c:1130:33: note: Calling function '_set_opp', 3rd argum=
ent 'opp' value is 0
    ret =3D _set_opp(dev, opp_table, opp, freq);
                                   ^
   drivers/opp/core.c:1029:43: note: Calling function '_opp_compare_key', 2=
nd argument 'opp' value is 0
    scaling_down =3D _opp_compare_key(old_opp, opp);
                                             ^
   drivers/opp/core.c:1595:21: note: Null pointer dereference
    if (opp1->level !=3D opp2->level)
                       ^
   drivers/opp/core.c:1618:4: warning: Address of local auto-variable assig=
ned to a function parameter. [autoVariables]
      *head =3D &opp->node;
      ^

vim +1025 drivers/opp/core.c

f3364e17d5716a drivers/opp/core.c            Viresh Kumar    2020-08-13  10=
00  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
01  static int _set_opp(struct device *dev, struct opp_table *opp_table,
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
02  		    struct dev_pm_opp *opp, unsigned long freq)
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  10=
03  {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
04  	struct dev_pm_opp *old_opp;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
05  	unsigned long old_freq;
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
06  	int scaling_down, ret;
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  10=
07  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
08  	if (unlikely(!opp))
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
09  		return _disable_opp_table(dev, opp_table);
aca48b61f96386 drivers/opp/core.c            Rajendra Nayak  2020-04-08  10=
10  =

81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
11  	/* Find the currently set OPP if we don't know already */
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
12  	if (unlikely(!opp_table->current_opp))
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
13  		_find_current_opp(dev, opp_table);
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  10=
14  =

81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
15  	old_opp =3D opp_table->current_opp;
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
16  	old_freq =3D old_opp->rate;
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
17  =

81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
18  	/* Return early if nothing to do */
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
19  	if (opp_table->enabled && old_opp =3D=3D opp) {
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
20  		dev_dbg(dev, "%s: OPPs are same, nothing to do\n", __func__);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
21  		return 0;
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  10=
22  	}
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  10=
23  =

f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
24  	dev_dbg(dev, "%s: switching OPP: Freq %lu -> %lu Hz, Level %u -> %u, B=
w %u -> %u\n",
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21 @10=
25  		__func__, old_freq, freq, old_opp->level, opp->level,
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
26  		old_opp->bandwidth ? old_opp->bandwidth[0].peak : 0,
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
27  		opp->bandwidth ? opp->bandwidth[0].peak : 0);
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
28  =

f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
29  	scaling_down =3D _opp_compare_key(old_opp, opp);
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
30  	if (scaling_down =3D=3D -1)
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
31  		scaling_down =3D 0;
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  10=
32  =

ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar    2018-06-14  10=
33  	/* Scaling up? Configure required OPPs before frequency */
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
34  	if (!scaling_down) {
2c59138c22f17c drivers/opp/core.c            Stephan Gerhold 2020-07-30  10=
35  		ret =3D _set_required_opps(dev, opp_table, opp, true);
ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar    2018-06-14  10=
36  		if (ret)
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
37  			return ret;
ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar    2018-06-14  10=
38  	}
ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar    2018-06-14  10=
39  =

7e535993fa4f67 drivers/opp/core.c            Viresh Kumar    2018-06-12  10=
40  	if (opp_table->set_opp) {
7e535993fa4f67 drivers/opp/core.c            Viresh Kumar    2018-06-12  10=
41  		ret =3D _set_opp_custom(opp_table, dev, old_freq, freq,
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
42  				      old_opp->supplies, opp->supplies);
7e535993fa4f67 drivers/opp/core.c            Viresh Kumar    2018-06-12  10=
43  	} else if (opp_table->regulators) {
c74b32fadc00f2 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  10=
44  		ret =3D _generic_set_opp_regulator(opp_table, dev, old_freq, freq,
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
45  						 old_opp->supplies,
c74b32fadc00f2 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  10=
46  						 opp->supplies);
c74b32fadc00f2 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  10=
47  	} else {
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  10=
48  		/* Only frequency scaling */
1d3c42cabbd351 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
49  		ret =3D _generic_set_opp_clk_only(dev, opp_table->clk, freq);
c74b32fadc00f2 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  10=
50  	}
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  10=
51  =

ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar    2018-06-14  10=
52  	/* Scaling down? Configure required OPPs after frequency */
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
53  	if (!ret && scaling_down) {
2c59138c22f17c drivers/opp/core.c            Stephan Gerhold 2020-07-30  10=
54  		ret =3D _set_required_opps(dev, opp_table, opp, false);
ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar    2018-06-14  10=
55  		if (ret)
ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar    2018-06-14  10=
56  			dev_err(dev, "Failed to set required opps: %d\n", ret);
c74b32fadc00f2 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  10=
57  	}
052c6f19141dd1 drivers/base/power/opp/core.c Viresh Kumar    2017-01-23  10=
58  =

72f80ce4ef9b75 drivers/opp/core.c            Viresh Kumar    2020-08-13  10=
59  	if (!ret) {
b00e667a6d8b2b drivers/opp/core.c            Viresh Kumar    2020-05-27  10=
60  		ret =3D _set_opp_bw(opp_table, opp, dev, false);
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
61  		if (!ret) {
72f80ce4ef9b75 drivers/opp/core.c            Viresh Kumar    2020-08-13  10=
62  			opp_table->enabled =3D true;
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
63  			dev_pm_opp_put(old_opp);
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
64  =

81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
65  			/* Make sure current_opp doesn't get freed */
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
66  			dev_pm_opp_get(opp);
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
67  			opp_table->current_opp =3D opp;
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar    2021-01-20  10=
68  		}
72f80ce4ef9b75 drivers/opp/core.c            Viresh Kumar    2020-08-13  10=
69  	}
fe2af40250bfc3 drivers/opp/core.c            Georgi Djakov   2020-05-12  10=
70  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
71  	return ret;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
72  }
386ba854d9f316 drivers/opp/core.c            Viresh Kumar    2021-01-21  10=
73  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1566548326034847415==--

