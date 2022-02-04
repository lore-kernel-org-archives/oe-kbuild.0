Content-Type: multipart/mixed; boundary="===============2451352952990645039=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android13-5.15 2/21] net/wireless/nl80211.c:5573:2: warning: Argument to kfree() is a constant address (4294966772), which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
Date: Sat, 05 Feb 2022 05:43:10 +0800
Message-ID: <202202050546.q8sMQuis-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2451352952990645039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   b5660868d7d68ff418e70b6512ed7925236575c6
commit: 42c6a8abb782f2378b17b9a3657411f54764780a [2/21] UPSTREAM: nl80211: =
don't put struct cfg80211_ap_settings on stack
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm-randconfig-c002-20220130 (https://download.01.org/0day-ci/archi=
ve/20220205/202202050546.q8sMQuis-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4c=
e6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add android-common https://android.googlesource.com/kern=
el/common
        git fetch --no-tags android-common android13-5.15
        git checkout 42c6a8abb782f2378b17b9a3657411f54764780a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   net/wireless/nl80211.c:13251:9: note: Calling 'kzalloc'
           func =3D kzalloc(sizeof(*func), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:13251:9: note: Returning from 'kzalloc'
           func =3D kzalloc(sizeof(*func), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:13252:6: note: Assuming 'func' is non-null
           if (!func)
               ^~~~~
   net/wireless/nl80211.c:13252:2: note: Taking false branch
           if (!func)
           ^
   net/wireless/nl80211.c:13257:6: note: Assuming the condition is false
           if (!tb[NL80211_NAN_FUNC_TYPE]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:13257:2: note: Taking false branch
           if (!tb[NL80211_NAN_FUNC_TYPE]) {
           ^
   net/wireless/nl80211.c:13265:6: note: Assuming the condition is false
           if (!tb[NL80211_NAN_FUNC_SERVICE_ID]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:13265:2: note: Taking false branch
           if (!tb[NL80211_NAN_FUNC_SERVICE_ID]) {
           ^
   net/wireless/nl80211.c:13276:6: note: Assuming the condition is false
           if (tb[NL80211_NAN_FUNC_SERVICE_INFO]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:13276:2: note: Taking false branch
           if (tb[NL80211_NAN_FUNC_SERVICE_INFO]) {
           ^
   net/wireless/nl80211.c:13289:6: note: Assuming the condition is false
           if (tb[NL80211_NAN_FUNC_TTL])
               ^~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:13289:2: note: Taking false branch
           if (tb[NL80211_NAN_FUNC_TTL])
           ^
   net/wireless/nl80211.c:13292:2: note: Control jumps to 'case NL80211_NAN=
_FUNC_SUBSCRIBE:'  at line 13310
           switch (func->type) {
           ^
   net/wireless/nl80211.c:13313:3: note:  Execution continues on line 13339
                   break;
                   ^
   net/wireless/nl80211.c:13339:6: note: Assuming the condition is true
           if (tb[NL80211_NAN_FUNC_SRF]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:13339:2: note: Taking true branch
           if (tb[NL80211_NAN_FUNC_SRF]) {
           ^
   net/wireless/nl80211.c:13347:7: note: Assuming 'err' is not equal to 0
                   if (err)
                       ^~~
   net/wireless/nl80211.c:13347:3: note: Taking true branch
                   if (err)
                   ^
   net/wireless/nl80211.c:13348:4: note: Control jumps to line 13433
                           goto out;
                           ^
   net/wireless/nl80211.c:13433:6: note: Assuming 'err' is >=3D 0
           if (err < 0) {
               ^~~~~~~
   net/wireless/nl80211.c:13433:2: note: Taking false branch
           if (err < 0) {
           ^
   net/wireless/nl80211.c:13440:6: note: Assuming the condition is false
           if (nla_put_u64_64bit(msg, NL80211_ATTR_COOKIE, func->cookie,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:13440:2: note: Taking false branch
           if (nla_put_u64_64bit(msg, NL80211_ATTR_COOKIE, func->cookie,
           ^
   net/wireless/nl80211.c:13444:36: note: Passing null pointer value via 1s=
t parameter 'skb'
           func_attr =3D nla_nest_start_noflag(msg, NL80211_ATTR_NAN_FUNC);
                                             ^~~
   net/wireless/nl80211.c:13444:14: note: Calling 'nla_nest_start_noflag'
           func_attr =3D nla_nest_start_noflag(msg, NL80211_ATTR_NAN_FUNC);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1765:59: note: Passing null pointer value via 1st =
parameter 'skb'
           struct nlattr *start =3D (struct nlattr *)skb_tail_pointer(skb);
                                                                    ^~~
   include/net/netlink.h:1765:42: note: Calling 'skb_tail_pointer'
           struct nlattr *start =3D (struct nlattr *)skb_tail_pointer(skb);
                                                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2261:9: note: Access to field 'tail' results in a=
 dereference of a null pointer (loaded from variable 'skb')
           return skb->tail;
                  ^~~
>> net/wireless/nl80211.c:5573:2: warning: Argument to kfree() is a constan=
t address (4294966772), which is not memory allocated by malloc() [clang-an=
alyzer-unix.Malloc]
           kfree(params->acl);
           ^     ~~~~~~~~~~~
   net/wireless/nl80211.c:5333:6: note: Assuming field 'iftype' is equal to=
 NL80211_IFTYPE_AP
           if (dev->ieee80211_ptr->iftype !=3D NL80211_IFTYPE_AP &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5333:54: note: Left side of '&&' is false
           if (dev->ieee80211_ptr->iftype !=3D NL80211_IFTYPE_AP &&
                                                               ^
   net/wireless/nl80211.c:5337:6: note: Assuming field 'start_ap' is non-nu=
ll
           if (!rdev->ops->start_ap)
               ^~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5337:2: note: Taking false branch
           if (!rdev->ops->start_ap)
           ^
   net/wireless/nl80211.c:5340:6: note: Assuming field 'beacon_interval' is=
 0
           if (wdev->beacon_interval)
               ^~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5340:2: note: Taking false branch
           if (wdev->beacon_interval)
           ^
   net/wireless/nl80211.c:5344:6: note: Assuming the condition is false
           if (!info->attrs[NL80211_ATTR_BEACON_INTERVAL] ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5344:6: note: Left side of '||' is false
   net/wireless/nl80211.c:5345:6: note: Assuming the condition is false
               !info->attrs[NL80211_ATTR_DTIM_PERIOD] ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5344:6: note: Left side of '||' is false
           if (!info->attrs[NL80211_ATTR_BEACON_INTERVAL] ||
               ^
   net/wireless/nl80211.c:5346:6: note: Assuming the condition is false
               !info->attrs[NL80211_ATTR_BEACON_HEAD])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5344:2: note: Taking false branch
           if (!info->attrs[NL80211_ATTR_BEACON_INTERVAL] ||
           ^
   net/wireless/nl80211.c:5350:6: note: Assuming 'params' is non-null
           if (!params)
               ^~~~~~~
   net/wireless/nl80211.c:5350:2: note: Taking false branch
           if (!params)
           ^
   net/wireless/nl80211.c:5354:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/wireless/nl80211.c:5354:2: note: Taking false branch
           if (err)
           ^
   net/wireless/nl80211.c:5364:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/wireless/nl80211.c:5364:2: note: Taking false branch
           if (err)
           ^
   net/wireless/nl80211.c:5374:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_SSID]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5374:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_SSID]) {
           ^
   net/wireless/nl80211.c:5384:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_HIDDEN_SSID])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5384:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_HIDDEN_SSID])
           ^
   net/wireless/nl80211.c:5388:21: note: Assuming the condition is false
           params->privacy =3D !!info->attrs[NL80211_ATTR_PRIVACY];
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5390:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_AUTH_TYPE]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5390:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_AUTH_TYPE]) {
           ^
   net/wireless/nl80211.c:5403:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/wireless/nl80211.c:5403:2: note: Taking false branch
           if (err)
           ^
   net/wireless/nl80211.c:5406:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_INACTIVITY_TIMEOUT]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5406:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_INACTIVITY_TIMEOUT]) {
           ^
   net/wireless/nl80211.c:5415:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_P2P_CTWINDOW]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5415:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_P2P_CTWINDOW]) {
           ^
   net/wireless/nl80211.c:5429:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_P2P_OPPPS]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5429:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_P2P_OPPPS]) {
           ^
   net/wireless/nl80211.c:5445:6: note: Assuming the condition is false
--
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5374:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_SSID]) {
           ^
   net/wireless/nl80211.c:5384:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_HIDDEN_SSID])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5384:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_HIDDEN_SSID])
           ^
   net/wireless/nl80211.c:5388:21: note: Assuming the condition is false
           params->privacy =3D !!info->attrs[NL80211_ATTR_PRIVACY];
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5390:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_AUTH_TYPE]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5390:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_AUTH_TYPE]) {
           ^
   net/wireless/nl80211.c:5403:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/wireless/nl80211.c:5403:2: note: Taking false branch
           if (err)
           ^
   net/wireless/nl80211.c:5406:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_INACTIVITY_TIMEOUT]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5406:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_INACTIVITY_TIMEOUT]) {
           ^
   net/wireless/nl80211.c:5415:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_P2P_CTWINDOW]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5415:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_P2P_CTWINDOW]) {
           ^
   net/wireless/nl80211.c:5429:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_P2P_OPPPS]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5429:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_P2P_OPPPS]) {
           ^
   net/wireless/nl80211.c:5445:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_WIPHY_FREQ]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5445:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_WIPHY_FREQ]) {
           ^
   net/wireless/nl80211.c:5449:13: note: Assuming field 'chan' is non-null
           } else if (wdev->preset_chandef.chan) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5449:9: note: Taking true branch
           } else if (wdev->preset_chandef.chan) {
                  ^
   net/wireless/nl80211.c:5456:6: note: Assuming the condition is false
           if (!cfg80211_reg_can_beacon_relax(&rdev->wiphy, &params->chande=
f,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/wireless/nl80211.c:5456:2: note: Taking false branch
           if (!cfg80211_reg_can_beacon_relax(&rdev->wiphy, &params->chande=
f,
           ^
   net/wireless/nl80211.c:5462:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_TX_RATES]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5462:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_TX_RATES]) {
           ^
   net/wireless/nl80211.c:5476:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_SMPS_MODE]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5476:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_SMPS_MODE]) {
           ^
   net/wireless/nl80211.c:5505:14: note: Field 'pbss' is true
           if (params->pbss && !rdev->wiphy.bands[NL80211_BAND_60GHZ]) {
                       ^
   net/wireless/nl80211.c:5505:6: note: Left side of '&&' is true
           if (params->pbss && !rdev->wiphy.bands[NL80211_BAND_60GHZ]) {
               ^
   net/wireless/nl80211.c:5505:22: note: Assuming the condition is false
           if (params->pbss && !rdev->wiphy.bands[NL80211_BAND_60GHZ]) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5505:2: note: Taking false branch
           if (params->pbss && !rdev->wiphy.bands[NL80211_BAND_60GHZ]) {
           ^
   net/wireless/nl80211.c:5510:6: note: Assuming the condition is true
           if (info->attrs[NL80211_ATTR_ACL_POLICY]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5510:2: note: Taking true branch
           if (info->attrs[NL80211_ATTR_ACL_POLICY]) {
           ^
   net/wireless/nl80211.c:5512:3: note: Taking true branch
                   if (IS_ERR(params->acl)) {
                   ^
   net/wireless/nl80211.c:5514:4: note: Control jumps to line 5573
                           goto out;
                           ^
   net/wireless/nl80211.c:5573:2: note: Argument to kfree() is a constant a=
ddress (4294967284), which is not memory allocated by malloc()
           kfree(params->acl);
           ^     ~~~~~~~~~~~
>> net/wireless/nl80211.c:5576:2: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           return err;
           ^      ~~~
   net/wireless/nl80211.c:5333:6: note: Assuming field 'iftype' is equal to=
 NL80211_IFTYPE_AP
           if (dev->ieee80211_ptr->iftype !=3D NL80211_IFTYPE_AP &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5333:54: note: Left side of '&&' is false
           if (dev->ieee80211_ptr->iftype !=3D NL80211_IFTYPE_AP &&
                                                               ^
   net/wireless/nl80211.c:5337:6: note: Assuming field 'start_ap' is non-nu=
ll
           if (!rdev->ops->start_ap)
               ^~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5337:2: note: Taking false branch
           if (!rdev->ops->start_ap)
           ^
   net/wireless/nl80211.c:5340:6: note: Assuming field 'beacon_interval' is=
 0
           if (wdev->beacon_interval)
               ^~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5340:2: note: Taking false branch
           if (wdev->beacon_interval)
           ^
   net/wireless/nl80211.c:5344:6: note: Assuming the condition is false
           if (!info->attrs[NL80211_ATTR_BEACON_INTERVAL] ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5344:6: note: Left side of '||' is false
   net/wireless/nl80211.c:5345:6: note: Assuming the condition is false
               !info->attrs[NL80211_ATTR_DTIM_PERIOD] ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5344:6: note: Left side of '||' is false
           if (!info->attrs[NL80211_ATTR_BEACON_INTERVAL] ||
               ^
   net/wireless/nl80211.c:5346:6: note: Assuming the condition is false
               !info->attrs[NL80211_ATTR_BEACON_HEAD])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5344:2: note: Taking false branch
           if (!info->attrs[NL80211_ATTR_BEACON_INTERVAL] ||
           ^
   net/wireless/nl80211.c:5350:6: note: Assuming 'params' is non-null
           if (!params)
               ^~~~~~~
   net/wireless/nl80211.c:5350:2: note: Taking false branch
           if (!params)
           ^
   net/wireless/nl80211.c:5354:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/wireless/nl80211.c:5354:2: note: Taking false branch
           if (err)
           ^
   net/wireless/nl80211.c:5364:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/wireless/nl80211.c:5364:2: note: Taking false branch
           if (err)
           ^
   net/wireless/nl80211.c:5374:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_SSID]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5374:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_SSID]) {
           ^
   net/wireless/nl80211.c:5384:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_HIDDEN_SSID])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5384:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_HIDDEN_SSID])
           ^
   net/wireless/nl80211.c:5388:21: note: Assuming the condition is false
           params->privacy =3D !!info->attrs[NL80211_ATTR_PRIVACY];
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5390:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_AUTH_TYPE]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5390:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_AUTH_TYPE]) {
           ^
   net/wireless/nl80211.c:5403:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/wireless/nl80211.c:5403:2: note: Taking false branch
           if (err)
           ^
   net/wireless/nl80211.c:5406:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_INACTIVITY_TIMEOUT]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5406:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_INACTIVITY_TIMEOUT]) {
           ^
   net/wireless/nl80211.c:5415:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_P2P_CTWINDOW]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5415:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_P2P_CTWINDOW]) {
           ^
   net/wireless/nl80211.c:5429:6: note: Assuming the condition is false
           if (info->attrs[NL80211_ATTR_P2P_OPPPS]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:5429:2: note: Taking false branch
           if (info->attrs[NL80211_ATTR_P2P_OPPPS]) {
           ^
   net/wireless/nl80211.c:5445:6: note: Assuming the condition is false

vim +5573 net/wireless/nl80211.c

e39e5b5e720676 Jouni Malinen             2012-09-30  5324  =

8860020e0be1f0 Johannes Berg             2012-02-13  5325  static int nl802=
11_start_ap(struct sk_buff *skb, struct genl_info *info)
8860020e0be1f0 Johannes Berg             2012-02-13  5326  {
8860020e0be1f0 Johannes Berg             2012-02-13  5327  	struct cfg80211=
_registered_device *rdev =3D info->user_ptr[0];
8860020e0be1f0 Johannes Berg             2012-02-13  5328  	struct net_devi=
ce *dev =3D info->user_ptr[1];
8860020e0be1f0 Johannes Berg             2012-02-13  5329  	struct wireless=
_dev *wdev =3D dev->ieee80211_ptr;
42c6a8abb782f2 Johannes Berg             2021-09-23  5330  	struct cfg80211=
_ap_settings *params;
8860020e0be1f0 Johannes Berg             2012-02-13  5331  	int err;
8860020e0be1f0 Johannes Berg             2012-02-13  5332  =

074ac8df9f93f2 Johannes Berg             2010-09-16  5333  	if (dev->ieee80=
211_ptr->iftype !=3D NL80211_IFTYPE_AP &&
4c476991062a0a Johannes Berg             2010-10-04  5334  	    dev->ieee80=
211_ptr->iftype !=3D NL80211_IFTYPE_P2P_GO)
4c476991062a0a Johannes Berg             2010-10-04  5335  		return -EOPNOT=
SUPP;
eec60b037a8755 Jouni Malinen             2009-03-20  5336  =

8860020e0be1f0 Johannes Berg             2012-02-13  5337  	if (!rdev->ops-=
>start_ap)
8860020e0be1f0 Johannes Berg             2012-02-13  5338  		return -EOPNOT=
SUPP;
8860020e0be1f0 Johannes Berg             2012-02-13  5339  =

8860020e0be1f0 Johannes Berg             2012-02-13  5340  	if (wdev->beaco=
n_interval)
8860020e0be1f0 Johannes Berg             2012-02-13  5341  		return -EALREA=
DY;
8860020e0be1f0 Johannes Berg             2012-02-13  5342  =

8860020e0be1f0 Johannes Berg             2012-02-13  5343  	/* these are re=
quired for START_AP */
ed1b6cc7f80f83 Johannes Berg             2007-12-19  5344  	if (!info->attr=
s[NL80211_ATTR_BEACON_INTERVAL] ||
ed1b6cc7f80f83 Johannes Berg             2007-12-19  5345  	    !info->attr=
s[NL80211_ATTR_DTIM_PERIOD] ||
4c476991062a0a Johannes Berg             2010-10-04  5346  	    !info->attr=
s[NL80211_ATTR_BEACON_HEAD])
4c476991062a0a Johannes Berg             2010-10-04  5347  		return -EINVAL;
ed1b6cc7f80f83 Johannes Berg             2007-12-19  5348  =

42c6a8abb782f2 Johannes Berg             2021-09-23  5349  	params =3D kzal=
loc(sizeof(*params), GFP_KERNEL);
42c6a8abb782f2 Johannes Berg             2021-09-23  5350  	if (!params)
42c6a8abb782f2 Johannes Berg             2021-09-23  5351  		return -ENOMEM;
42c6a8abb782f2 Johannes Berg             2021-09-23  5352  =

42c6a8abb782f2 Johannes Berg             2021-09-23  5353  	err =3D nl80211=
_parse_beacon(rdev, info->attrs, &params->beacon);
8860020e0be1f0 Johannes Berg             2012-02-13  5354  	if (err)
42c6a8abb782f2 Johannes Berg             2021-09-23  5355  		goto out;
8860020e0be1f0 Johannes Berg             2012-02-13  5356  =

42c6a8abb782f2 Johannes Berg             2021-09-23  5357  	params->beacon_=
interval =3D
56d1893d94bc06 Johannes Berg             2011-05-09  5358  		nla_get_u32(in=
fo->attrs[NL80211_ATTR_BEACON_INTERVAL]);
42c6a8abb782f2 Johannes Berg             2021-09-23  5359  	params->dtim_pe=
riod =3D
56d1893d94bc06 Johannes Berg             2011-05-09  5360  		nla_get_u32(in=
fo->attrs[NL80211_ATTR_DTIM_PERIOD]);
56d1893d94bc06 Johannes Berg             2011-05-09  5361  =

0c317a02ca982c Purushottam Kushwaha      2016-10-12  5362  	err =3D cfg8021=
1_validate_beacon_int(rdev, dev->ieee80211_ptr->iftype,
42c6a8abb782f2 Johannes Berg             2021-09-23  5363  					   params->=
beacon_interval);
56d1893d94bc06 Johannes Berg             2011-05-09  5364  	if (err)
42c6a8abb782f2 Johannes Berg             2021-09-23  5365  		goto out;
56d1893d94bc06 Johannes Berg             2011-05-09  5366  =

32e9de846be885 Jouni Malinen             2011-08-10  5367  	/*
8860020e0be1f0 Johannes Berg             2012-02-13  5368  	 * In theory, s=
ome of these attributes should be required here
8860020e0be1f0 Johannes Berg             2012-02-13  5369  	 * but since th=
ey were not used when the command was originally
8860020e0be1f0 Johannes Berg             2012-02-13  5370  	 * added, keep =
them optional for old user space programs to let
8860020e0be1f0 Johannes Berg             2012-02-13  5371  	 * them continu=
e to work with drivers that do not need the
8860020e0be1f0 Johannes Berg             2012-02-13  5372  	 * additional i=
nformation -- drivers must check!
32e9de846be885 Jouni Malinen             2011-08-10  5373  	 */
32e9de846be885 Jouni Malinen             2011-08-10  5374  	if (info->attrs=
[NL80211_ATTR_SSID]) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5375  		params->ssid =
=3D nla_data(info->attrs[NL80211_ATTR_SSID]);
42c6a8abb782f2 Johannes Berg             2021-09-23  5376  		params->ssid_l=
en =3D
32e9de846be885 Jouni Malinen             2011-08-10  5377  			nla_len(info-=
>attrs[NL80211_ATTR_SSID]);
42c6a8abb782f2 Johannes Berg             2021-09-23  5378  		if (params->ss=
id_len =3D=3D 0) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5379  			err =3D -EINV=
AL;
42c6a8abb782f2 Johannes Berg             2021-09-23  5380  			goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5381  		}
32e9de846be885 Jouni Malinen             2011-08-10  5382  	}
32e9de846be885 Jouni Malinen             2011-08-10  5383  =

ab0d76f6823cc3 Johannes Berg             2018-10-02  5384  	if (info->attrs=
[NL80211_ATTR_HIDDEN_SSID])
42c6a8abb782f2 Johannes Berg             2021-09-23  5385  		params->hidden=
_ssid =3D nla_get_u32(
32e9de846be885 Jouni Malinen             2011-08-10  5386  			info->attrs[N=
L80211_ATTR_HIDDEN_SSID]);
32e9de846be885 Jouni Malinen             2011-08-10  5387  =

42c6a8abb782f2 Johannes Berg             2021-09-23  5388  	params->privacy=
 =3D !!info->attrs[NL80211_ATTR_PRIVACY];
5fb628e9105eef Jouni Malinen             2011-08-10  5389  =

5fb628e9105eef Jouni Malinen             2011-08-10  5390  	if (info->attrs=
[NL80211_ATTR_AUTH_TYPE]) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5391  		params->auth_t=
ype =3D nla_get_u32(
5fb628e9105eef Jouni Malinen             2011-08-10  5392  			info->attrs[N=
L80211_ATTR_AUTH_TYPE]);
42c6a8abb782f2 Johannes Berg             2021-09-23  5393  		if (!nl80211_v=
alid_auth_type(rdev, params->auth_type,
42c6a8abb782f2 Johannes Berg             2021-09-23  5394  					     NL8021=
1_CMD_START_AP)) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5395  			err =3D -EINV=
AL;
42c6a8abb782f2 Johannes Berg             2021-09-23  5396  			goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5397  		}
5fb628e9105eef Jouni Malinen             2011-08-10  5398  	} else
42c6a8abb782f2 Johannes Berg             2021-09-23  5399  		params->auth_t=
ype =3D NL80211_AUTHTYPE_AUTOMATIC;
5fb628e9105eef Jouni Malinen             2011-08-10  5400  =

42c6a8abb782f2 Johannes Berg             2021-09-23  5401  	err =3D nl80211=
_crypto_settings(rdev, info, &params->crypto,
5fb628e9105eef Jouni Malinen             2011-08-10  5402  				      NL8021=
1_MAX_NR_CIPHER_SUITES);
5fb628e9105eef Jouni Malinen             2011-08-10  5403  	if (err)
42c6a8abb782f2 Johannes Berg             2021-09-23  5404  		goto out;
5fb628e9105eef Jouni Malinen             2011-08-10  5405  =

1b658f118b11de Vasanthakumar Thiagarajan 2012-03-02  5406  	if (info->attrs=
[NL80211_ATTR_INACTIVITY_TIMEOUT]) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5407  		if (!(rdev->wi=
phy.features & NL80211_FEATURE_INACTIVITY_TIMER)) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5408  			err =3D -EOPN=
OTSUPP;
42c6a8abb782f2 Johannes Berg             2021-09-23  5409  			goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5410  		}
42c6a8abb782f2 Johannes Berg             2021-09-23  5411  		params->inacti=
vity_timeout =3D nla_get_u16(
1b658f118b11de Vasanthakumar Thiagarajan 2012-03-02  5412  			info->attrs[N=
L80211_ATTR_INACTIVITY_TIMEOUT]);
1b658f118b11de Vasanthakumar Thiagarajan 2012-03-02  5413  	}
1b658f118b11de Vasanthakumar Thiagarajan 2012-03-02  5414  =

53cabad70ecf0c Johannes Berg             2012-11-14  5415  	if (info->attrs=
[NL80211_ATTR_P2P_CTWINDOW]) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5416  		if (dev->ieee8=
0211_ptr->iftype !=3D NL80211_IFTYPE_P2P_GO) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5417  			err =3D -EINV=
AL;
42c6a8abb782f2 Johannes Berg             2021-09-23  5418  			goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5419  		}
42c6a8abb782f2 Johannes Berg             2021-09-23  5420  		params->p2p_ct=
window =3D
53cabad70ecf0c Johannes Berg             2012-11-14  5421  			nla_get_u8(in=
fo->attrs[NL80211_ATTR_P2P_CTWINDOW]);
42c6a8abb782f2 Johannes Berg             2021-09-23  5422  		if (params->p2=
p_ctwindow !=3D 0 &&
42c6a8abb782f2 Johannes Berg             2021-09-23  5423  		    !(rdev->wi=
phy.features & NL80211_FEATURE_P2P_GO_CTWIN)) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5424  			err =3D -EINV=
AL;
42c6a8abb782f2 Johannes Berg             2021-09-23  5425  			goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5426  		}
53cabad70ecf0c Johannes Berg             2012-11-14  5427  	}
53cabad70ecf0c Johannes Berg             2012-11-14  5428  =

53cabad70ecf0c Johannes Berg             2012-11-14  5429  	if (info->attrs=
[NL80211_ATTR_P2P_OPPPS]) {
53cabad70ecf0c Johannes Berg             2012-11-14  5430  		u8 tmp;
53cabad70ecf0c Johannes Berg             2012-11-14  5431  =

42c6a8abb782f2 Johannes Berg             2021-09-23  5432  		if (dev->ieee8=
0211_ptr->iftype !=3D NL80211_IFTYPE_P2P_GO) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5433  			err =3D -EINV=
AL;
42c6a8abb782f2 Johannes Berg             2021-09-23  5434  			goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5435  		}
53cabad70ecf0c Johannes Berg             2012-11-14  5436  		tmp =3D nla_ge=
t_u8(info->attrs[NL80211_ATTR_P2P_OPPPS]);
42c6a8abb782f2 Johannes Berg             2021-09-23  5437  		params->p2p_op=
p_ps =3D tmp;
42c6a8abb782f2 Johannes Berg             2021-09-23  5438  		if (params->p2=
p_opp_ps !=3D 0 &&
42c6a8abb782f2 Johannes Berg             2021-09-23  5439  		    !(rdev->wi=
phy.features & NL80211_FEATURE_P2P_GO_OPPPS)) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5440  			err =3D -EINV=
AL;
42c6a8abb782f2 Johannes Berg             2021-09-23  5441  			goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5442  		}
53cabad70ecf0c Johannes Berg             2012-11-14  5443  	}
53cabad70ecf0c Johannes Berg             2012-11-14  5444  =

aa430da41019c1 Johannes Berg             2012-05-16  5445  	if (info->attrs=
[NL80211_ATTR_WIPHY_FREQ]) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5446  		err =3D nl8021=
1_parse_chandef(rdev, info, &params->chandef);
683b6d3b31a519 Johannes Berg             2012-11-08  5447  		if (err)
42c6a8abb782f2 Johannes Berg             2021-09-23  5448  			goto out;
683b6d3b31a519 Johannes Berg             2012-11-08  5449  	} else if (wdev=
->preset_chandef.chan) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5450  		params->chande=
f =3D wdev->preset_chandef;
42c6a8abb782f2 Johannes Berg             2021-09-23  5451  	} else if (!nl8=
0211_get_ap_channel(rdev, params)) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5452  		err =3D -EINVA=
L;
42c6a8abb782f2 Johannes Berg             2021-09-23  5453  		goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5454  	}
aa430da41019c1 Johannes Berg             2012-05-16  5455  =

42c6a8abb782f2 Johannes Berg             2021-09-23  5456  	if (!cfg80211_r=
eg_can_beacon_relax(&rdev->wiphy, &params->chandef,
42c6a8abb782f2 Johannes Berg             2021-09-23  5457  					   wdev->if=
type)) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5458  		err =3D -EINVA=
L;
42c6a8abb782f2 Johannes Berg             2021-09-23  5459  		goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5460  	}
aa430da41019c1 Johannes Berg             2012-05-16  5461  =

a7c7fbff6a408d Purushottam Kushwaha      2016-09-14  5462  	if (info->attrs=
[NL80211_ATTR_TX_RATES]) {
9a5f6488623730 Tamizh Chelvam            2020-05-13  5463  		err =3D nl8021=
1_parse_tx_bitrate_mask(info, info->attrs,
9a5f6488623730 Tamizh Chelvam            2020-05-13  5464  						    NL8021=
1_ATTR_TX_RATES,
42c6a8abb782f2 Johannes Berg             2021-09-23  5465  						    &param=
s->beacon_rate,
857b34c4fb104c Rajkumar Manoharan        2020-10-16  5466  						    dev, f=
alse);
a7c7fbff6a408d Purushottam Kushwaha      2016-09-14  5467  		if (err)
42c6a8abb782f2 Johannes Berg             2021-09-23  5468  			goto out;
a7c7fbff6a408d Purushottam Kushwaha      2016-09-14  5469  =

42c6a8abb782f2 Johannes Berg             2021-09-23  5470  		err =3D valida=
te_beacon_tx_rate(rdev, params->chandef.chan->band,
42c6a8abb782f2 Johannes Berg             2021-09-23  5471  					      &para=
ms->beacon_rate);
a7c7fbff6a408d Purushottam Kushwaha      2016-09-14  5472  		if (err)
42c6a8abb782f2 Johannes Berg             2021-09-23  5473  			goto out;
a7c7fbff6a408d Purushottam Kushwaha      2016-09-14  5474  	}
a7c7fbff6a408d Purushottam Kushwaha      2016-09-14  5475  =

18998c381b19bf Eliad Peller              2014-09-10  5476  	if (info->attrs=
[NL80211_ATTR_SMPS_MODE]) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5477  		params->smps_m=
ode =3D
18998c381b19bf Eliad Peller              2014-09-10  5478  			nla_get_u8(in=
fo->attrs[NL80211_ATTR_SMPS_MODE]);
42c6a8abb782f2 Johannes Berg             2021-09-23  5479  		switch (params=
->smps_mode) {
18998c381b19bf Eliad Peller              2014-09-10  5480  		case NL80211_S=
MPS_OFF:
18998c381b19bf Eliad Peller              2014-09-10  5481  			break;
18998c381b19bf Eliad Peller              2014-09-10  5482  		case NL80211_S=
MPS_STATIC:
18998c381b19bf Eliad Peller              2014-09-10  5483  			if (!(rdev->w=
iphy.features &
42c6a8abb782f2 Johannes Berg             2021-09-23  5484  			      NL80211=
_FEATURE_STATIC_SMPS)) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5485  				err =3D -EIN=
VAL;
42c6a8abb782f2 Johannes Berg             2021-09-23  5486  				goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5487  			}
18998c381b19bf Eliad Peller              2014-09-10  5488  			break;
18998c381b19bf Eliad Peller              2014-09-10  5489  		case NL80211_S=
MPS_DYNAMIC:
18998c381b19bf Eliad Peller              2014-09-10  5490  			if (!(rdev->w=
iphy.features &
42c6a8abb782f2 Johannes Berg             2021-09-23  5491  			      NL80211=
_FEATURE_DYNAMIC_SMPS)) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5492  				err =3D -EIN=
VAL;
42c6a8abb782f2 Johannes Berg             2021-09-23  5493  				goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5494  			}
18998c381b19bf Eliad Peller              2014-09-10  5495  			break;
18998c381b19bf Eliad Peller              2014-09-10  5496  		default:
42c6a8abb782f2 Johannes Berg             2021-09-23  5497  			err =3D -EINV=
AL;
42c6a8abb782f2 Johannes Berg             2021-09-23  5498  			goto out;
18998c381b19bf Eliad Peller              2014-09-10  5499  		}
18998c381b19bf Eliad Peller              2014-09-10  5500  	} else {
42c6a8abb782f2 Johannes Berg             2021-09-23  5501  		params->smps_m=
ode =3D NL80211_SMPS_OFF;
18998c381b19bf Eliad Peller              2014-09-10  5502  	}
18998c381b19bf Eliad Peller              2014-09-10  5503  =

42c6a8abb782f2 Johannes Berg             2021-09-23  5504  	params->pbss =
=3D nla_get_flag(info->attrs[NL80211_ATTR_PBSS]);
42c6a8abb782f2 Johannes Berg             2021-09-23  5505  	if (params->pbs=
s && !rdev->wiphy.bands[NL80211_BAND_60GHZ]) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5506  		err =3D -EOPNO=
TSUPP;
42c6a8abb782f2 Johannes Berg             2021-09-23  5507  		goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5508  	}
6e8ef842223b90 Purushottam Kushwaha      2016-07-05  5509  =

4baf6bea37247e Ola Olsson                2015-10-29  5510  	if (info->attrs=
[NL80211_ATTR_ACL_POLICY]) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5511  		params->acl =
=3D parse_acl_data(&rdev->wiphy, info);
42c6a8abb782f2 Johannes Berg             2021-09-23  5512  		if (IS_ERR(par=
ams->acl)) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5513  			err =3D PTR_E=
RR(params->acl);
42c6a8abb782f2 Johannes Berg             2021-09-23  5514  			goto out;
42c6a8abb782f2 Johannes Berg             2021-09-23  5515  		}
4baf6bea37247e Ola Olsson                2015-10-29  5516  	}
4baf6bea37247e Ola Olsson                2015-10-29  5517  =

42c6a8abb782f2 Johannes Berg             2021-09-23  5518  	params->twt_res=
ponder =3D
a0de1ca383c77a John Crispin              2019-05-28  5519  		    nla_get_fl=
ag(info->attrs[NL80211_ATTR_TWT_RESPONDER]);
a0de1ca383c77a John Crispin              2019-05-28  5520  =

796e90f42b7e52 John Crispin              2019-07-30  5521  	if (info->attrs=
[NL80211_ATTR_HE_OBSS_PD]) {
796e90f42b7e52 John Crispin              2019-07-30  5522  		err =3D nl8021=
1_parse_he_obss_pd(
796e90f42b7e52 John Crispin              2019-07-30  5523  					info->attrs=
[NL80211_ATTR_HE_OBSS_PD],
42c6a8abb782f2 Johannes Berg             2021-09-23  5524  					&params->he=
_obss_pd);
bc7a39b4272b96 Luca Coelho               2020-06-26  5525  		if (err)
9951ebfcdf2b97 Johannes Berg             2020-02-21  5526  			goto out;
796e90f42b7e52 John Crispin              2019-07-30  5527  	}
796e90f42b7e52 John Crispin              2019-07-30  5528  =

5c5e52d1bb9625 John Crispin              2019-12-17  5529  	if (info->attrs=
[NL80211_ATTR_HE_BSS_COLOR]) {
5c5e52d1bb9625 John Crispin              2019-12-17  5530  		err =3D nl8021=
1_parse_he_bss_color(
5c5e52d1bb9625 John Crispin              2019-12-17  5531  					info->attrs=
[NL80211_ATTR_HE_BSS_COLOR],
42c6a8abb782f2 Johannes Berg             2021-09-23  5532  					&params->he=
_bss_color);
5c5e52d1bb9625 John Crispin              2019-12-17  5533  		if (err)
60a0121f8fa64b Luca Coelho               2020-06-26  5534  			goto out;
5c5e52d1bb9625 John Crispin              2019-12-17  5535  	}
5c5e52d1bb9625 John Crispin              2019-12-17  5536  =

291c49ded2fda1 Aloka Dixit               2020-09-11  5537  	if (info->attrs=
[NL80211_ATTR_FILS_DISCOVERY]) {
291c49ded2fda1 Aloka Dixit               2020-09-11  5538  		err =3D nl8021=
1_parse_fils_discovery(rdev,
291c49ded2fda1 Aloka Dixit               2020-09-11  5539  						   info->a=
ttrs[NL80211_ATTR_FILS_DISCOVERY],
42c6a8abb782f2 Johannes Berg             2021-09-23  5540  						   params);
291c49ded2fda1 Aloka Dixit               2020-09-11  5541  		if (err)
291c49ded2fda1 Aloka Dixit               2020-09-11  5542  			goto out;
291c49ded2fda1 Aloka Dixit               2020-09-11  5543  	}
291c49ded2fda1 Aloka Dixit               2020-09-11  5544  =

7443dcd1f1718a Aloka Dixit               2020-09-11  5545  	if (info->attrs=
[NL80211_ATTR_UNSOL_BCAST_PROBE_RESP]) {
7443dcd1f1718a Aloka Dixit               2020-09-11  5546  		err =3D nl8021=
1_parse_unsol_bcast_probe_resp(
7443dcd1f1718a Aloka Dixit               2020-09-11  5547  			rdev, info->a=
ttrs[NL80211_ATTR_UNSOL_BCAST_PROBE_RESP],
42c6a8abb782f2 Johannes Berg             2021-09-23  5548  			params);
7443dcd1f1718a Aloka Dixit               2020-09-11  5549  		if (err)
abaf94ecc9c356 Johannes Berg             2021-04-08  5550  			goto out;
7443dcd1f1718a Aloka Dixit               2020-09-11  5551  	}
7443dcd1f1718a Aloka Dixit               2020-09-11  5552  =

42c6a8abb782f2 Johannes Berg             2021-09-23  5553  	nl80211_calcula=
te_ap_params(params);
66cd794e3c30b8 Johannes Berg             2017-02-07  5554  =

fe4943702c850f Srinivas Dasari           2019-01-23  5555  	if (info->attrs=
[NL80211_ATTR_EXTERNAL_AUTH_SUPPORT])
42c6a8abb782f2 Johannes Berg             2021-09-23  5556  		params->flags =
|=3D AP_SETTINGS_EXTERNAL_AUTH_SUPPORT;
fe4943702c850f Srinivas Dasari           2019-01-23  5557  =

c56589ed1d25ae Simon Wunderlich          2013-11-21  5558  	wdev_lock(wdev);
42c6a8abb782f2 Johannes Berg             2021-09-23  5559  	err =3D rdev_st=
art_ap(rdev, dev, params);
46c1dd0c7fac54 Felix Fietkau             2012-06-19  5560  	if (!err) {
42c6a8abb782f2 Johannes Berg             2021-09-23  5561  		wdev->preset_c=
handef =3D params->chandef;
42c6a8abb782f2 Johannes Berg             2021-09-23  5562  		wdev->beacon_i=
nterval =3D params->beacon_interval;
42c6a8abb782f2 Johannes Berg             2021-09-23  5563  		wdev->chandef =
=3D params->chandef;
42c6a8abb782f2 Johannes Berg             2021-09-23  5564  		wdev->ssid_len=
 =3D params->ssid_len;
42c6a8abb782f2 Johannes Berg             2021-09-23  5565  		memcpy(wdev->s=
sid, params->ssid, wdev->ssid_len);
466a306142c002 Denis Kenzior             2018-03-26  5566  =

466a306142c002 Denis Kenzior             2018-03-26  5567  		if (info->attr=
s[NL80211_ATTR_SOCKET_OWNER])
466a306142c002 Denis Kenzior             2018-03-26  5568  			wdev->conn_ow=
ner_nlportid =3D info->snd_portid;
46c1dd0c7fac54 Felix Fietkau             2012-06-19  5569  	}
c56589ed1d25ae Simon Wunderlich          2013-11-21  5570  	wdev_unlock(wde=
v);
77765eaf5cfb6b Vasanthakumar Thiagarajan 2013-01-18  5571  =

9951ebfcdf2b97 Johannes Berg             2020-02-21  5572  out:
42c6a8abb782f2 Johannes Berg             2021-09-23 @5573  	kfree(params->a=
cl);
42c6a8abb782f2 Johannes Berg             2021-09-23  5574  	kfree(params);
77765eaf5cfb6b Vasanthakumar Thiagarajan 2013-01-18  5575  =

8860020e0be1f0 Johannes Berg             2012-02-13 @5576  	return err;
ed1b6cc7f80f83 Johannes Berg             2007-12-19  5577  }
ed1b6cc7f80f83 Johannes Berg             2007-12-19  5578  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2451352952990645039==--

