Content-Type: multipart/mixed; boundary="===============5550788159482366578=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/yocto 2/2] drivers/mmc/core/block.c:1076:12: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 13 Feb 2022 02:17:10 +0800
Message-ID: <202202122206.QadIzQek-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5550788159482366578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Ranjan Dutta <ranjan.dutta@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   c1454bb2993a11fdcd48794cdd65569c3b33a5b0
commit: c1454bb2993a11fdcd48794cdd65569c3b33a5b0 [2/2] Merge branch 'my/v5.=
10.83' into lts2020/yocto
:::::: branch date: 9 weeks ago
:::::: commit date: 9 weeks ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
212/202202122206.QadIzQek-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa845d=
7a245d85c441d0bd44fc7b6c3be8f3de8d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/c1454bb2993a11fdc=
d48794cdd65569c3b33a5b0
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout c1454bb2993a11fdcd48794cdd65569c3b33a5b0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                      ^~~~
   drivers/mmc/core/block.c:884:35: note: Left side of '&&' is false
           if (!mmc_host_is_spi(card->host) && !(cmd.resp[0] & R1_APP_CMD))
                                            ^
   drivers/mmc/core/block.c:884:2: note: '?' condition is false
           if (!mmc_host_is_spi(card->host) && !(cmd.resp[0] & R1_APP_CMD))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mmc/core/block.c:884:35: note: Left side of '&&' is false
           if (!mmc_host_is_spi(card->host) && !(cmd.resp[0] & R1_APP_CMD))
                                            ^
   drivers/mmc/core/block.c:884:2: note: '?' condition is false
           if (!mmc_host_is_spi(card->host) && !(cmd.resp[0] & R1_APP_CMD))
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
   drivers/mmc/core/block.c:884:2: note: Taking false branch
           if (!mmc_host_is_spi(card->host) && !(cmd.resp[0] & R1_APP_CMD))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mmc/core/block.c:903:11: note: Storing uninitialized value
           blocks =3D kmalloc(4, GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/block.c:904:6: note: Assuming 'blocks' is non-null
           if (!blocks)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mmc/core/block.c:904:2: note: '?' condition is false
           if (!blocks)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mmc/core/block.c:904:7: note: 'blocks' is non-null
           if (!blocks)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/mmc/core/block.c:904:2: note: '?' condition is false
           if (!blocks)
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
   drivers/mmc/core/block.c:904:2: note: Taking false branch
           if (!blocks)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mmc/core/block.c:911:11: note: 1st function call argument is an =
uninitialized value
           result =3D ntohl(*blocks);
                    ^
   include/linux/byteorder/generic.h:140:18: note: expanded from macro 'nto=
hl'
   #define ntohl(x) ___ntohl(x)
                    ^~~~~~~~~~~
   include/linux/byteorder/generic.h:136:21: note: expanded from macro '___=
ntohl'
   #define ___ntohl(x) __be32_to_cpu(x)
                       ^~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:115:28: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                              ^                 ~~~~~~~~~~
>> drivers/mmc/core/block.c:1076:12: warning: Branch condition evaluates to=
 a garbage value [clang-analyzer-core.uninitialized.Branch]
           op_mode =3D idata[0]->ic.write_flag ? REQ_OP_DRV_OUT : REQ_OP_DR=
V_IN,
                     ^
   drivers/mmc/core/block.c:1145:6: note: Assuming 'rpmb' is non-null
           if (!rpmb)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mmc/core/block.c:1145:2: note: '?' condition is false
           if (!rpmb)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mmc/core/block.c:1145:7: note: 'rpmb' is non-null
           if (!rpmb)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/mmc/core/block.c:1145:2: note: '?' condition is false
           if (!rpmb)
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
   drivers/mmc/core/block.c:1145:2: note: Taking false branch
           if (!rpmb)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mmc/core/block.c:1149:6: note: Assuming 'idata' is non-null
           if (!idata)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mmc/core/block.c:1149:2: note: '?' condition is false
           if (!idata)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mmc/core/block.c:1149:7: note: 'idata' is non-null
           if (!idata)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/mmc/core/block.c:1149:2: note: '?' condition is false
           if (!idata)
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
   drivers/mmc/core/block.c:1149:2: note: Taking false branch
           if (!idata)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mmc/core/block.c:1152:14: note: Assuming 'i' is < 'num_of_cmds'
           for (i =3D 0; i < num_of_cmds; i++) {

vim +1076 drivers/mmc/core/block.c

5ec1239694c74e Linus Walleij 2017-05-19  1055  =

a85416e2755608 Tomas Winkler 2015-01-28  1056  static int mmc_blk_rpmb_proc=
ess(struct mmc_blk_data *md,
a85416e2755608 Tomas Winkler 2015-01-28  1057  				struct mmc_blk_ioc_data =
*idata[],
a85416e2755608 Tomas Winkler 2015-01-28  1058  				u64 num_of_cmds)
a85416e2755608 Tomas Winkler 2015-01-28  1059  {
a85416e2755608 Tomas Winkler 2015-01-28  1060  	struct mmc_card *card;
a85416e2755608 Tomas Winkler 2015-01-28  1061  	struct mmc_queue *mq;
a85416e2755608 Tomas Winkler 2015-01-28  1062  	int err =3D 0;
a85416e2755608 Tomas Winkler 2015-01-28  1063  	struct request *req;
a85416e2755608 Tomas Winkler 2015-01-28  1064  	int op_mode;
a85416e2755608 Tomas Winkler 2015-01-28  1065  =

a85416e2755608 Tomas Winkler 2015-01-28  1066  	card =3D md->queue.card;
a85416e2755608 Tomas Winkler 2015-01-28  1067  	if (IS_ERR(card)) {
a85416e2755608 Tomas Winkler 2015-01-28  1068  		err =3D PTR_ERR(card);
a85416e2755608 Tomas Winkler 2015-01-28  1069  		goto cmd_err;
a85416e2755608 Tomas Winkler 2015-01-28  1070  	}
a85416e2755608 Tomas Winkler 2015-01-28  1071  =

a85416e2755608 Tomas Winkler 2015-01-28  1072  	/*
a85416e2755608 Tomas Winkler 2015-01-28  1073  	 * Dispatch the ioctl()s in=
to the block request queue.
a85416e2755608 Tomas Winkler 2015-01-28  1074  	 */
a85416e2755608 Tomas Winkler 2015-01-28  1075  	mq =3D &md->queue;
a85416e2755608 Tomas Winkler 2015-01-28 @1076  	op_mode =3D idata[0]->ic.wr=
ite_flag ? REQ_OP_DRV_OUT : REQ_OP_DRV_IN,
a85416e2755608 Tomas Winkler 2015-01-28  1077  	req =3D blk_get_request(mq-=
>queue, op_mode, 0);
a85416e2755608 Tomas Winkler 2015-01-28  1078  	if (IS_ERR(req)) {
a85416e2755608 Tomas Winkler 2015-01-28  1079  		err =3D PTR_ERR(req);
a85416e2755608 Tomas Winkler 2015-01-28  1080  		goto cmd_err;
a85416e2755608 Tomas Winkler 2015-01-28  1081  	}
a85416e2755608 Tomas Winkler 2015-01-28  1082  =

a85416e2755608 Tomas Winkler 2015-01-28  1083  	req_to_mmc_queue_req(req)->=
drv_op =3D MMC_DRV_OP_IOCTL_RPMB;
a85416e2755608 Tomas Winkler 2015-01-28  1084  	req_to_mmc_queue_req(req)->=
drv_op_data =3D idata;
a85416e2755608 Tomas Winkler 2015-01-28  1085  	req_to_mmc_queue_req(req)->=
ioc_count =3D num_of_cmds;
a85416e2755608 Tomas Winkler 2015-01-28  1086  =

a85416e2755608 Tomas Winkler 2015-01-28  1087  	blk_execute_rq(mq->queue, N=
ULL, req, 0);
a85416e2755608 Tomas Winkler 2015-01-28  1088  =

a85416e2755608 Tomas Winkler 2015-01-28  1089  	err =3D req_to_mmc_queue_re=
q(req)->drv_op_result;
a85416e2755608 Tomas Winkler 2015-01-28  1090  =

a85416e2755608 Tomas Winkler 2015-01-28  1091  	blk_put_request(req);
a85416e2755608 Tomas Winkler 2015-01-28  1092  =

a85416e2755608 Tomas Winkler 2015-01-28  1093  cmd_err:
a85416e2755608 Tomas Winkler 2015-01-28  1094  	return err;
a85416e2755608 Tomas Winkler 2015-01-28  1095  }
a85416e2755608 Tomas Winkler 2015-01-28  1096  =


:::::: The code at line 1076 was first introduced by commit
:::::: a85416e27556088f75f35fb5c464ece37d204591 mmc: block: register RPMB p=
artition with the RPMB subsystem

:::::: TO: Tomas Winkler <tomas.winkler@intel.com>
:::::: CC: Dutta, Ranjan <ranjan.dutta@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5550788159482366578==--

