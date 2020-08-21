Content-Type: multipart/mixed; boundary="===============0578860175230861585=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/virt_wifi.c:648:6: warning: Variable 'err' is reassigned a value before the old one has been used.
Date: Fri, 21 Aug 2020 22:25:59 +0800
Message-ID: <202008212255.c7Eies9n%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0578860175230861585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Taehee Yoo <ap420073@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   da2968ff879b9e74688cdc658f646971991d2c56
commit: 1962f86b42ed06ea6af9ff09390243b99d9eb83a virt_wifi: fix refcnt leak=
 in module exit routine
date:   10 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 10 months ago
compiler: sparc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/wireless/virt_wifi.c:648:6: warning: Variable 'err' is reass=
igned a value before the old one has been used. [redundantAssignment]
    err =3D rtnl_link_register(&virt_wifi_link_ops);
        ^
   drivers/net/wireless/virt_wifi.c:643:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D -ENOMEM;
        ^
   drivers/net/wireless/virt_wifi.c:648:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D rtnl_link_register(&virt_wifi_link_ops);
        ^
   drivers/net/wireless/virt_wifi.c:159:6: warning: Local variable tag shad=
ows outer variable [shadowVar]
     u8 tag;
        ^
   drivers/net/wireless/virt_wifi.c:159:6: note: Shadowed declaration
     u8 tag;
        ^
   drivers/net/wireless/virt_wifi.c:159:6: note: Shadow variable
     u8 tag;
        ^
   drivers/net/wireless/virt_wifi.c:160:6: warning: Local variable len shad=
ows outer variable [shadowVar]
     u8 len;
        ^
   drivers/net/wireless/virt_wifi.c:160:6: note: Shadowed declaration
     u8 len;
        ^
   drivers/net/wireless/virt_wifi.c:160:6: note: Shadow variable
     u8 len;
        ^
   drivers/net/wireless/virt_wifi.c:161:6: warning: Local variable ssid sha=
dows outer variable [shadowVar]
     u8 ssid[8];
        ^
   drivers/net/wireless/virt_wifi.c:161:6: note: Shadowed declaration
     u8 ssid[8];
        ^
   drivers/net/wireless/virt_wifi.c:161:6: note: Shadow variable
     u8 ssid[8];
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D1962f86b42ed06ea6af9ff09390243b99d9eb83a
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 1962f86b42ed06ea6af9ff09390243b99d9eb83a
vim +/err +648 drivers/net/wireless/virt_wifi.c

1962f86b42ed06e Taehee Yoo      2019-10-21  630  =

c7cdba31ed8b875 Cody Schuffelen 2018-11-20  631  /* Acquires and releases t=
he rtnl lock. */
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  632  static int __init virt_wif=
i_init_module(void)
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  633  {
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  634  	int err;
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  635  =

c7cdba31ed8b875 Cody Schuffelen 2018-11-20  636  	/* Guaranteed to be local=
lly-administered and not multicast. */
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  637  	eth_random_addr(fake_rout=
er_bssid);
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  638  =

1962f86b42ed06e Taehee Yoo      2019-10-21  639  	err =3D register_netdevic=
e_notifier(&virt_wifi_notifier);
1962f86b42ed06e Taehee Yoo      2019-10-21  640  	if (err)
1962f86b42ed06e Taehee Yoo      2019-10-21  641  		return err;
1962f86b42ed06e Taehee Yoo      2019-10-21  642  =

1962f86b42ed06e Taehee Yoo      2019-10-21  643  	err =3D -ENOMEM;
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  644  	common_wiphy =3D virt_wif=
i_make_wiphy();
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  645  	if (!common_wiphy)
1962f86b42ed06e Taehee Yoo      2019-10-21  646  		goto notifier;
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  647  =

c7cdba31ed8b875 Cody Schuffelen 2018-11-20 @648  	err =3D rtnl_link_registe=
r(&virt_wifi_link_ops);
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  649  	if (err)
1962f86b42ed06e Taehee Yoo      2019-10-21  650  		goto destroy_wiphy;
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  651  =

1962f86b42ed06e Taehee Yoo      2019-10-21  652  	return 0;
1962f86b42ed06e Taehee Yoo      2019-10-21  653  =

1962f86b42ed06e Taehee Yoo      2019-10-21  654  destroy_wiphy:
1962f86b42ed06e Taehee Yoo      2019-10-21  655  	virt_wifi_destroy_wiphy(c=
ommon_wiphy);
1962f86b42ed06e Taehee Yoo      2019-10-21  656  notifier:
1962f86b42ed06e Taehee Yoo      2019-10-21  657  	unregister_netdevice_noti=
fier(&virt_wifi_notifier);
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  658  	return err;
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  659  }
c7cdba31ed8b875 Cody Schuffelen 2018-11-20  660  =


:::::: The code at line 648 was first introduced by commit
:::::: c7cdba31ed8b87526db978976392802d3f93110c mac80211-next: rtnetlink wi=
fi simulation device

:::::: TO: Cody Schuffelen <schuffelen@google.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0578860175230861585==--

