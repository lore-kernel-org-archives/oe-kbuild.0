Content-Type: multipart/mixed; boundary="===============0825296297150588855=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vireshk-pm:opp/config 4/40] drivers/opp/debugfs.c:212:8: warning: Null pointer dereference: new_dev [nullPointer]
Date: Tue, 31 May 2022 02:16:47 +0800
Message-ID: <202205310244.H85KdNV1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0825296297150588855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/o=
pp/debugfs.c:212:8: warning: Null pointer dereference: new_dev [nullPointer=
]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Xiaomeng Tong <xiam0nd.tong@gmail.com>
CC: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/=
config
head:   2f8b5b70bf8a070271e0f9f63564ad5fbef85a40
commit: c14faabf5364c5b1be115bbc660310966ca7371f [4/40] opp: use list itera=
tor only inside the loop
:::::: branch date: 13 hours ago
:::::: commit date: 7 weeks ago
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c14faabf5364c5b1be115bbc660310966ca7371f
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/opp/debugfs.c:212:8: warning: Null pointer dereference: new_dev =
[nullPointer]
    dev =3D new_dev->dev;
          ^
   drivers/opp/debugfs.c:198:31: note: Assignment 'new_dev=3DNULL', assigne=
d value is 0
    struct opp_device *new_dev =3D NULL, *iter;
                                 ^
   drivers/opp/debugfs.c:204:12: note: Assuming condition is false
     if (iter !=3D opp_dev) {
              ^
   drivers/opp/debugfs.c:212:8: note: Null pointer dereference
    dev =3D new_dev->dev;
          ^
   drivers/opp/debugfs.c:213:27: warning: Null pointer dereference: new_dev=
 [nullPointer]
    debugfs_remove_recursive(new_dev->dentry);
                             ^
   drivers/opp/debugfs.c:198:31: note: Assignment 'new_dev=3DNULL', assigne=
d value is 0
    struct opp_device *new_dev =3D NULL, *iter;
                                 ^
   drivers/opp/debugfs.c:204:12: note: Assuming condition is false
     if (iter !=3D opp_dev) {
              ^
   drivers/opp/debugfs.c:213:27: note: Null pointer dereference
    debugfs_remove_recursive(new_dev->dentry);
                             ^

vim +212 drivers/opp/debugfs.c

deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  1=
94  =

2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  1=
95  static void opp_migrate_dentry(struct opp_device *opp_dev,
2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  1=
96  			       struct opp_table *opp_table)
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  1=
97  {
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  1=
98  	struct opp_device *new_dev =3D NULL, *iter;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  1=
99  	const struct device *dev;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
00  	struct dentry *dentry;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
01  =

2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  2=
02  	/* Look for next opp-dev */
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  2=
03  	list_for_each_entry(iter, &opp_table->dev_list, node)
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  2=
04  		if (iter !=3D opp_dev) {
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  2=
05  			new_dev =3D iter;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
06  			break;
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  2=
07  		}
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  2=
08  =

c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  2=
09  	BUG_ON(!new_dev);
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
10  =

deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
11  	/* new_dev is guaranteed to be valid here */
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11 @2=
12  	dev =3D new_dev->dev;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
13  	debugfs_remove_recursive(new_dev->dentry);
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
14  =

2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  2=
15  	opp_set_dev_name(dev, opp_table->dentry_name);
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
16  =

2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  2=
17  	dentry =3D debugfs_rename(rootdir, opp_dev->dentry, rootdir,
2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  2=
18  				opp_table->dentry_name);
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
19  	if (!dentry) {
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
20  		dev_err(dev, "%s: Failed to rename link from: %s to %s\n",
2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  2=
21  			__func__, dev_name(opp_dev->dev), dev_name(dev));
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
22  		return;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
23  	}
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
24  =

deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
25  	new_dev->dentry =3D dentry;
2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  2=
26  	opp_table->dentry =3D dentry;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
27  }
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  2=
28  =


:::::: The code at line 212 was first introduced by commit
:::::: deaa51465105a7eda19a627b10372f4f7c51a4df PM / OPP: Add debugfs suppo=
rt

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0825296297150588855==--

