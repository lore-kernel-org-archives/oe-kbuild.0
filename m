Content-Type: multipart/mixed; boundary="===============7232494256216336403=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/mpls/af_mpls.c:704:16: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 03 Feb 2022 02:04:53 +0800
Message-ID: <202202030216.RyyRnPqe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7232494256216336403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Benjamin Poirier <bpoirier@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9f7fb8de5d9bac17b6392a14af40baf555d9129b
commit: 7d4741eacdefa5f0475431645b56baf00784df1f net: mpls: Fix notificatio=
ns when deleting a device
date:   9 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-c002-20220121 (https://download.01.org/0day-ci/archi=
ve/20220203/202202030216.RyyRnPqe-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3=
b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7d4741eacdefa5f0475431645b56baf00784df1f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7d4741eacdefa5f0475431645b56baf00784df1f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                 ^
   net/mac80211/airtime.c:677:8: note: '?' condition is false
                   else if (duration > 150 * 1024) /* <=3D VHT20 MCS5 1S or=
 MCS2 2S */
                        ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/mac80211/airtime.c:677:8: note: Taking false branch
                   else if (duration > 150 * 1024) /* <=3D VHT20 MCS5 1S or=
 MCS2 2S */
                        ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/mac80211/airtime.c:679:8: note: '?' condition is false
                   else if (duration > 70 * 1024) /* <=3D VHT20 MCS5 2S */
                        ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/mac80211/airtime.c:679:8: note: '?' condition is false
                   else if (duration > 70 * 1024) /* <=3D VHT20 MCS5 2S */
                        ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/mac80211/airtime.c:679:8: note: Taking false branch
                   else if (duration > 70 * 1024) /* <=3D VHT20 MCS5 2S */
                        ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/mac80211/airtime.c:681:12: note: Assuming field 'encoding' is not eq=
ual to RX_ENC_HE
                   else if (stat.encoding !=3D RX_ENC_HE ||
                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/mac80211/airtime.c:681:39: note: Left side of '||' is true
                   else if (stat.encoding !=3D RX_ENC_HE ||
                                                       ^
   net/mac80211/airtime.c:681:8: note: '?' condition is false
                   else if (stat.encoding !=3D RX_ENC_HE ||
                        ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/mac80211/airtime.c:681:17: note: Field 'encoding' is not equal to RX=
_ENC_HE
                   else if (stat.encoding !=3D RX_ENC_HE ||
                                 ^
   net/mac80211/airtime.c:681:39: note: Left side of '||' is true
                   else if (stat.encoding !=3D RX_ENC_HE ||
                                                       ^
   net/mac80211/airtime.c:681:8: note: '?' condition is true
                   else if (stat.encoding !=3D RX_ENC_HE ||
                        ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/mac80211/airtime.c:681:8: note: Taking true branch
                   else if (stat.encoding !=3D RX_ENC_HE ||
                        ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/mac80211/airtime.c:690:25: note: The left operand of '>>' is a garba=
ge value
                   duration +=3D (overhead >> agg_shift);
                                ~~~~~~~~ ^
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
>> net/mpls/af_mpls.c:704:16: warning: The left expression of the compound =
assignment is an uninitialized value. The computed value will also be garba=
ge [clang-analyzer-core.uninitialized.Assign]
                   nh->nh_flags |=3D RTNH_F_DEAD;
                                ^
   net/mpls/af_mpls.c:977:7: note: Assuming the condition is false
           if ((index =3D=3D LABEL_NOT_SPECIFIED) &&
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/mpls/af_mpls.c:977:37: note: Left side of '&&' is false
           if ((index =3D=3D LABEL_NOT_SPECIFIED) &&
                                              ^
   net/mpls/af_mpls.c:977:2: note: '?' condition is false
           if ((index =3D=3D LABEL_NOT_SPECIFIED) &&
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/mpls/af_mpls.c:977:37: note: Left side of '&&' is false
           if ((index =3D=3D LABEL_NOT_SPECIFIED) &&
                                              ^
   net/mpls/af_mpls.c:977:2: note: '?' condition is false
           if ((index =3D=3D LABEL_NOT_SPECIFIED) &&
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/mpls/af_mpls.c:977:2: note: Taking false branch
           if ((index =3D=3D LABEL_NOT_SPECIFIED) &&
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/mpls/af_mpls.c:982:2: note: '?' condition is false
           if (!mpls_label_ok(net, &index, extack))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/mpls/af_mpls.c:982:2: note: '?' condition is false
           if (!mpls_label_ok(net, &index, extack))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/mpls/af_mpls.c:982:2: note: Taking false branch
           if (!mpls_label_ok(net, &index, extack))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/mpls/af_mpls.c:987:2: note: Assuming the condition is true
           if (cfg->rc_nlflags & NLM_F_APPEND) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/mpls/af_mpls.c:987:2: note: '?' condition is false
           if (cfg->rc_nlflags & NLM_F_APPEND) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/mpls/af_mpls.c:987:2: note: '?' condition is false
           if (cfg->rc_nlflags & NLM_F_APPEND) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \

vim +704 net/mpls/af_mpls.c

01faef2cebae02 Roopa Prabhu    2015-07-21  678  =

cf4b24f0024fc2 Robert Shearman 2015-10-27  679  static int mpls_nh_assign_d=
ev(struct net *net, struct mpls_route *rt,
cf4b24f0024fc2 Robert Shearman 2015-10-27  680  			      struct mpls_nh *nh=
, int oif)
f8efb73c97e2fa Roopa Prabhu    2015-10-23  681  {
f8efb73c97e2fa Roopa Prabhu    2015-10-23  682  	struct net_device *dev =3D=
 NULL;
f8efb73c97e2fa Roopa Prabhu    2015-10-23  683  	int err =3D -ENODEV;
f8efb73c97e2fa Roopa Prabhu    2015-10-23  684  =

cf4b24f0024fc2 Robert Shearman 2015-10-27  685  	dev =3D find_outdev(net, r=
t, nh, oif);
f8efb73c97e2fa Roopa Prabhu    2015-10-23  686  	if (IS_ERR(dev)) {
f8efb73c97e2fa Roopa Prabhu    2015-10-23  687  		err =3D PTR_ERR(dev);
f8efb73c97e2fa Roopa Prabhu    2015-10-23  688  		dev =3D NULL;
f8efb73c97e2fa Roopa Prabhu    2015-10-23  689  		goto errout;
f8efb73c97e2fa Roopa Prabhu    2015-10-23  690  	}
f8efb73c97e2fa Roopa Prabhu    2015-10-23  691  =

f8efb73c97e2fa Roopa Prabhu    2015-10-23  692  	/* Ensure this is a suppor=
ted device */
f8efb73c97e2fa Roopa Prabhu    2015-10-23  693  	err =3D -EINVAL;
f8efb73c97e2fa Roopa Prabhu    2015-10-23  694  	if (!mpls_dev_get(dev))
f8efb73c97e2fa Roopa Prabhu    2015-10-23  695  		goto errout;
f8efb73c97e2fa Roopa Prabhu    2015-10-23  696  =

a3e948e83a302c Robert Shearman 2015-12-10  697  	if ((nh->nh_via_table =3D=
=3D NEIGH_LINK_TABLE) &&
a3e948e83a302c Robert Shearman 2015-12-10  698  	    (dev->addr_len !=3D nh=
->nh_via_alen))
a3e948e83a302c Robert Shearman 2015-12-10  699  		goto errout;
a3e948e83a302c Robert Shearman 2015-12-10  700  =

f8efb73c97e2fa Roopa Prabhu    2015-10-23  701  	RCU_INIT_POINTER(nh->nh_de=
v, dev);
f8efb73c97e2fa Roopa Prabhu    2015-10-23  702  =

c89359a42e2a49 Roopa Prabhu    2015-12-01  703  	if (!(dev->flags & IFF_UP)=
) {
c89359a42e2a49 Roopa Prabhu    2015-12-01 @704  		nh->nh_flags |=3D RTNH_F_=
DEAD;
c89359a42e2a49 Roopa Prabhu    2015-12-01  705  	} else {
c89359a42e2a49 Roopa Prabhu    2015-12-01  706  		unsigned int flags;
c89359a42e2a49 Roopa Prabhu    2015-12-01  707  =

c89359a42e2a49 Roopa Prabhu    2015-12-01  708  		flags =3D dev_get_flags(d=
ev);
c89359a42e2a49 Roopa Prabhu    2015-12-01  709  		if (!(flags & (IFF_RUNNIN=
G | IFF_LOWER_UP)))
c89359a42e2a49 Roopa Prabhu    2015-12-01  710  			nh->nh_flags |=3D RTNH_F=
_LINKDOWN;
c89359a42e2a49 Roopa Prabhu    2015-12-01  711  	}
c89359a42e2a49 Roopa Prabhu    2015-12-01  712  =

f8efb73c97e2fa Roopa Prabhu    2015-10-23  713  	return 0;
f8efb73c97e2fa Roopa Prabhu    2015-10-23  714  =

f8efb73c97e2fa Roopa Prabhu    2015-10-23  715  errout:
f8efb73c97e2fa Roopa Prabhu    2015-10-23  716  	return err;
f8efb73c97e2fa Roopa Prabhu    2015-10-23  717  }
f8efb73c97e2fa Roopa Prabhu    2015-10-23  718  =


:::::: The code at line 704 was first introduced by commit
:::::: c89359a42e2a49656451569c382eed63e781153c mpls: support for dead rout=
es

:::::: TO: Roopa Prabhu <roopa@cumulusnetworks.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7232494256216336403==--

