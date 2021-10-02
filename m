Content-Type: multipart/mixed; boundary="===============4094951977117789043=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/opp/core.c:1025:45: warning: Possible null pointer dereference: opp [nullPointer]
Date: Sun, 03 Oct 2021 06:26:22 +0800
Message-ID: <202110030613.YyCe7RuE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4094951977117789043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   02d5e016800d082058b3d3b7c3ede136cdc6ddcb
commit: f0b88fa45595254fa51427bd8ca321732e2eb73d opp: Allow _set_opp() to w=
ork for non-freq devices
date:   8 months ago
:::::: branch date: 3 days ago
:::::: commit date: 8 months ago
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

f3364e17d5716a7 drivers/opp/core.c            Viresh Kumar    2020-08-13  1=
000  =

386ba854d9f3163 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
001  static int _set_opp(struct device *dev, struct opp_table *opp_table,
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
002  		    struct dev_pm_opp *opp, unsigned long freq)
6a0712f6f199e73 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  1=
003  {
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
004  	struct dev_pm_opp *old_opp;
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
005  	unsigned long old_freq;
f0b88fa45595254 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
006  	int scaling_down, ret;
6a0712f6f199e73 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  1=
007  =

386ba854d9f3163 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
008  	if (unlikely(!opp))
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
009  		return _disable_opp_table(dev, opp_table);
aca48b61f963869 drivers/opp/core.c            Rajendra Nayak  2020-04-08  1=
010  =

81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
011  	/* Find the currently set OPP if we don't know already */
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
012  	if (unlikely(!opp_table->current_opp))
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
013  		_find_current_opp(dev, opp_table);
6a0712f6f199e73 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  1=
014  =

81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
015  	old_opp =3D opp_table->current_opp;
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
016  	old_freq =3D old_opp->rate;
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
017  =

81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
018  	/* Return early if nothing to do */
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
019  	if (opp_table->enabled && old_opp =3D=3D opp) {
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
020  		dev_dbg(dev, "%s: OPPs are same, nothing to do\n", __func__);
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
021  		return 0;
6a0712f6f199e73 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  1=
022  	}
6a0712f6f199e73 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  1=
023  =

f0b88fa45595254 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
024  	dev_dbg(dev, "%s: switching OPP: Freq %lu -> %lu Hz, Level %u -> %u, =
Bw %u -> %u\n",
f0b88fa45595254 drivers/opp/core.c            Viresh Kumar    2021-01-21 @1=
025  		__func__, old_freq, freq, old_opp->level, opp->level,
f0b88fa45595254 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
026  		old_opp->bandwidth ? old_opp->bandwidth[0].peak : 0,
f0b88fa45595254 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
027  		opp->bandwidth ? opp->bandwidth[0].peak : 0);
f0b88fa45595254 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
028  =

f0b88fa45595254 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
029  	scaling_down =3D _opp_compare_key(old_opp, opp);
f0b88fa45595254 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
030  	if (scaling_down =3D=3D -1)
f0b88fa45595254 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
031  		scaling_down =3D 0;
947355850fcb3bb drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  1=
032  =

ca1b5d77b1c69df drivers/opp/core.c            Viresh Kumar    2018-06-14  1=
033  	/* Scaling up? Configure required OPPs before frequency */
f0b88fa45595254 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
034  	if (!scaling_down) {
2c59138c22f17c1 drivers/opp/core.c            Stephan Gerhold 2020-07-30  1=
035  		ret =3D _set_required_opps(dev, opp_table, opp, true);
ca1b5d77b1c69df drivers/opp/core.c            Viresh Kumar    2018-06-14  1=
036  		if (ret)
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
037  			return ret;
ca1b5d77b1c69df drivers/opp/core.c            Viresh Kumar    2018-06-14  1=
038  	}
ca1b5d77b1c69df drivers/opp/core.c            Viresh Kumar    2018-06-14  1=
039  =

7e535993fa4f671 drivers/opp/core.c            Viresh Kumar    2018-06-12  1=
040  	if (opp_table->set_opp) {
7e535993fa4f671 drivers/opp/core.c            Viresh Kumar    2018-06-12  1=
041  		ret =3D _set_opp_custom(opp_table, dev, old_freq, freq,
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
042  				      old_opp->supplies, opp->supplies);
7e535993fa4f671 drivers/opp/core.c            Viresh Kumar    2018-06-12  1=
043  	} else if (opp_table->regulators) {
c74b32fadc00f24 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  1=
044  		ret =3D _generic_set_opp_regulator(opp_table, dev, old_freq, freq,
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
045  						 old_opp->supplies,
c74b32fadc00f24 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  1=
046  						 opp->supplies);
c74b32fadc00f24 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  1=
047  	} else {
947355850fcb3bb drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  1=
048  		/* Only frequency scaling */
1d3c42cabbd351e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
049  		ret =3D _generic_set_opp_clk_only(dev, opp_table->clk, freq);
c74b32fadc00f24 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  1=
050  	}
6a0712f6f199e73 drivers/base/power/opp/core.c Viresh Kumar    2016-02-09  1=
051  =

ca1b5d77b1c69df drivers/opp/core.c            Viresh Kumar    2018-06-14  1=
052  	/* Scaling down? Configure required OPPs after frequency */
f0b88fa45595254 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
053  	if (!ret && scaling_down) {
2c59138c22f17c1 drivers/opp/core.c            Stephan Gerhold 2020-07-30  1=
054  		ret =3D _set_required_opps(dev, opp_table, opp, false);
ca1b5d77b1c69df drivers/opp/core.c            Viresh Kumar    2018-06-14  1=
055  		if (ret)
ca1b5d77b1c69df drivers/opp/core.c            Viresh Kumar    2018-06-14  1=
056  			dev_err(dev, "Failed to set required opps: %d\n", ret);
c74b32fadc00f24 drivers/base/power/opp/core.c Viresh Kumar    2017-05-23  1=
057  	}
052c6f19141dd13 drivers/base/power/opp/core.c Viresh Kumar    2017-01-23  1=
058  =

72f80ce4ef9b756 drivers/opp/core.c            Viresh Kumar    2020-08-13  1=
059  	if (!ret) {
b00e667a6d8b2b0 drivers/opp/core.c            Viresh Kumar    2020-05-27  1=
060  		ret =3D _set_opp_bw(opp_table, opp, dev, false);
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
061  		if (!ret) {
72f80ce4ef9b756 drivers/opp/core.c            Viresh Kumar    2020-08-13  1=
062  			opp_table->enabled =3D true;
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
063  			dev_pm_opp_put(old_opp);
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
064  =

81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
065  			/* Make sure current_opp doesn't get freed */
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
066  			dev_pm_opp_get(opp);
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
067  			opp_table->current_opp =3D opp;
81c4d8a3c41488e drivers/opp/core.c            Viresh Kumar    2021-01-20  1=
068  		}
72f80ce4ef9b756 drivers/opp/core.c            Viresh Kumar    2020-08-13  1=
069  	}
fe2af40250bfc3c drivers/opp/core.c            Georgi Djakov   2020-05-12  1=
070  =

386ba854d9f3163 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
071  	return ret;
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
072  }
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar    2021-01-21  1=
073  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4094951977117789043==--

