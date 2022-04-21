Content-Type: multipart/mixed; boundary="===============4929430144204115535=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/char/ipmi/ipmi_msghandler.c:4523:4: warning: Value stored to 'chan' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 21 Apr 2022 21:12:00 +0800
Message-ID: <202204212148.NgX7U5Rq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4929430144204115535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Corey Minyard <minyard@acm.org>
CC: Andrew Manley <andrew.manley@sealingtech.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: 059747c245f0e9af5e109eece7d3414dbe08d513 ipmi: Add support for IPMB=
 direct messages
date:   7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-c006-20220420 (https://download.01.org/0day-ci/arc=
hive/20220421/202204212148.NgX7U5Rq-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd=
5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D059747c245f0e9af5e109eece7d3414dbe08d513
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 059747c245f0e9af5e109eece7d3414dbe08d513
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/char/ipmi/ipmi_msghandler.c:3477:6: note: Assuming field 'in_shu=
tdown' is false
           if (!intf->in_shutdown)
               ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3477:2: note: Taking true branch
           if (!intf->in_shutdown)
           ^
   drivers/char/ipmi/ipmi_msghandler.c:3478:3: note: Calling 'bmc_get_devic=
e_id'
                   bmc_get_device_id(intf, NULL, NULL, NULL, NULL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2704:9: note: Calling '__bmc_get_dev=
ice_id'
           return __bmc_get_device_id(intf, bmc, id, guid_set, guid, -1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2573:18: note: 'intf' is not equal t=
o NULL
           bool intf_set =3D intf !=3D NULL;
                           ^~~~
   drivers/char/ipmi/ipmi_msghandler.c:2575:7: note: 'intf' is non-null
           if (!intf) {
                ^~~~
   drivers/char/ipmi/ipmi_msghandler.c:2575:2: note: Taking false branch
           if (!intf) {
           ^
   drivers/char/ipmi/ipmi_msghandler.c:2602:6: note: Assuming field 'in_bmc=
_register' is false
           if (intf->in_bmc_register ||
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2602:6: note: Left side of '||' is f=
alse
   drivers/char/ipmi/ipmi_msghandler.c:2603:7: note: Assuming field 'dyn_id=
_set' is 0
               (bmc->dyn_id_set && time_is_after_jiffies(bmc->dyn_id_expiry=
)))
                ^~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2603:23: note: Left side of '&&' is =
false
               (bmc->dyn_id_set && time_is_after_jiffies(bmc->dyn_id_expiry=
)))
                                ^
   drivers/char/ipmi/ipmi_msghandler.c:2607:2: note: Calling '__get_guid'
           __get_guid(intf);
           ^~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3298:7: note: Calling 'send_guid_cmd'
           rv =3D send_guid_cmd(intf, 0);
                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3242:9: note: Calling 'i_ipmi_reques=
t'
           return i_ipmi_request(NULL,
                  ^~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2285:6: note: 'supplied_recv' is null
           if (supplied_recv)
               ^~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2285:2: note: Taking false branch
           if (supplied_recv)
           ^
   drivers/char/ipmi/ipmi_msghandler.c:2289:7: note: 'recv_msg' is not equa=
l to NULL
                   if (recv_msg =3D=3D NULL) {
                       ^~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2289:3: note: Taking false branch
                   if (recv_msg =3D=3D NULL) {
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:2296:6: note: 'supplied_smi' is null
           if (supplied_smi)
               ^~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2296:2: note: Taking false branch
           if (supplied_smi)
           ^
   drivers/char/ipmi/ipmi_msghandler.c:2299:13: note: Calling 'ipmi_alloc_s=
mi_msg'
                   smi_msg =3D ipmi_alloc_smi_msg();
                             ^~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:5030:7: note: Memory is allocated
           rv =3D kmalloc(sizeof(struct ipmi_smi_msg), GFP_ATOMIC);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:5031:6: note: Assuming 'rv' is non-n=
ull
           if (rv) {
               ^~
   drivers/char/ipmi/ipmi_msghandler.c:5031:2: note: Taking true branch
           if (rv) {
           ^
   drivers/char/ipmi/ipmi_msghandler.c:2299:13: note: Returned allocated me=
mory
                   smi_msg =3D ipmi_alloc_smi_msg();
                             ^~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2300:7: note: 'smi_msg' is not equal=
 to NULL
                   if (smi_msg =3D=3D NULL) {
                       ^~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2300:3: note: Taking false branch
                   if (smi_msg =3D=3D NULL) {
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:2309:6: note: Assuming field 'in_shu=
tdown' is true
           if (intf->in_shutdown) {
               ^~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2309:2: note: Taking true branch
           if (intf->in_shutdown) {
           ^
   drivers/char/ipmi/ipmi_msghandler.c:2311:3: note: Control jumps to line =
2346
                   goto out_err;
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:2347:3: note: Potential leak of memo=
ry pointed to by 'smi_msg'
                   ipmi_free_recv_msg(recv_msg);
                   ^
>> drivers/char/ipmi/ipmi_msghandler.c:4523:4: warning: Value stored to 'ch=
an' is never read [clang-analyzer-deadcode.DeadStores]
                           chan =3D 0;
                           ^      ~
   drivers/char/ipmi/ipmi_msghandler.c:4523:4: note: Value stored to 'chan'=
 is never read
                           chan =3D 0;
                           ^      ~
   drivers/char/ipmi/ipmi_msghandler.c:5063:6: warning: Branch condition ev=
aluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (msg->user && !oops_in_progress)
               ^
   drivers/char/ipmi/ipmi_msghandler.c:5299:6: note: Assuming 'has_panicked=
' is 0
           if (has_panicked)
               ^~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:5299:2: note: Taking false branch
           if (has_panicked)
           ^
   drivers/char/ipmi/ipmi_msghandler.c:5304:2: note: Left side of '||' is f=
alse
           list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/char/ipmi/ipmi_msghandler.c:5304:2: note: Left side of '||' is f=
alse
           list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/char/ipmi/ipmi_msghandler.c:5304:2: note: Left side of '||' is t=
rue
           list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:291:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   drivers/char/ipmi/ipmi_msghandler.c:5304:2: note: Taking false branch
           list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:5304:2: note: Loop condition is fals=
e.  Exiting loop
           list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'

vim +/chan +4523 drivers/char/ipmi/ipmi_msghandler.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  4429  =

c70d749986f6f1 Corey Minyard   2008-04-29  4430  /*
7adf579c8babf6 Corey Minyard   2012-03-28  4431   * Handle a received messa=
ge.  Return 1 if the message should be requeued,
c70d749986f6f1 Corey Minyard   2008-04-29  4432   * 0 if the message should=
 be freed, or -1 if the message should not
c70d749986f6f1 Corey Minyard   2008-04-29  4433   * be freed or requeued.
c70d749986f6f1 Corey Minyard   2008-04-29  4434   */
a567b6230066e3 Corey Minyard   2018-04-05  4435  static int handle_one_recv=
_msg(struct ipmi_smi *intf,
^1da177e4c3f41 Linus Torvalds  2005-04-16  4436  			       struct ipmi_smi_=
msg *msg)
^1da177e4c3f41 Linus Torvalds  2005-04-16  4437  {
059747c245f0e9 Corey Minyard   2021-09-24  4438  	int requeue =3D 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4439  	int chan;
059747c245f0e9 Corey Minyard   2021-09-24  4440  	unsigned char cc;
059747c245f0e9 Corey Minyard   2021-09-24  4441  	bool is_cmd =3D !((msg->r=
sp[0] >> 2) & 1);
^1da177e4c3f41 Linus Torvalds  2005-04-16  4442  =

8ee7b485bbfbd1 Andy Shevchenko 2019-10-11  4443  	pr_debug("Recv: %*ph\n", =
msg->rsp_size, msg->rsp);
383035211c79d4 Tony Camuso     2019-08-22  4444  =

059747c245f0e9 Corey Minyard   2021-09-24  4445  	if (msg->rsp_size < 2) {
059747c245f0e9 Corey Minyard   2021-09-24  4446  		/* Message is too small =
to be correct. */
059747c245f0e9 Corey Minyard   2021-09-24  4447  		dev_warn(intf->si_dev,
059747c245f0e9 Corey Minyard   2021-09-24  4448  			 "BMC returned too smal=
l a message for netfn %x cmd %x, got %d bytes\n",
059747c245f0e9 Corey Minyard   2021-09-24  4449  			 (msg->data[0] >> 2) | =
1, msg->data[1], msg->rsp_size);
059747c245f0e9 Corey Minyard   2021-09-24  4450  =

059747c245f0e9 Corey Minyard   2021-09-24  4451  return_unspecified:
059747c245f0e9 Corey Minyard   2021-09-24  4452  		/* Generate an error res=
ponse for the message. */
059747c245f0e9 Corey Minyard   2021-09-24  4453  		msg->rsp[0] =3D msg->dat=
a[0] | (1 << 2);
059747c245f0e9 Corey Minyard   2021-09-24  4454  		msg->rsp[1] =3D msg->dat=
a[1];
059747c245f0e9 Corey Minyard   2021-09-24  4455  		msg->rsp[2] =3D IPMI_ERR=
_UNSPECIFIED;
059747c245f0e9 Corey Minyard   2021-09-24  4456  		msg->rsp_size =3D 3;
059747c245f0e9 Corey Minyard   2021-09-24  4457  	} else if (msg->type =3D=
=3D IPMI_SMI_MSG_TYPE_IPMB_DIRECT) {
059747c245f0e9 Corey Minyard   2021-09-24  4458  		/* commands must have at=
 least 3 bytes, responses 4. */
059747c245f0e9 Corey Minyard   2021-09-24  4459  		if (is_cmd && (msg->rsp_=
size < 3)) {
059747c245f0e9 Corey Minyard   2021-09-24  4460  			ipmi_inc_stat(intf, inv=
alid_commands);
059747c245f0e9 Corey Minyard   2021-09-24  4461  			goto out;
059747c245f0e9 Corey Minyard   2021-09-24  4462  		}
059747c245f0e9 Corey Minyard   2021-09-24  4463  		if (!is_cmd && (msg->rsp=
_size < 4))
059747c245f0e9 Corey Minyard   2021-09-24  4464  			goto return_unspecified;
059747c245f0e9 Corey Minyard   2021-09-24  4465  	} else if ((msg->data_siz=
e >=3D 2)
383035211c79d4 Tony Camuso     2019-08-22  4466  	    && (msg->data[0] =3D=
=3D (IPMI_NETFN_APP_REQUEST << 2))
383035211c79d4 Tony Camuso     2019-08-22  4467  	    && (msg->data[1] =3D=
=3D IPMI_SEND_MSG_CMD)
383035211c79d4 Tony Camuso     2019-08-22  4468  	    && (msg->user_data =
=3D=3D NULL)) {
383035211c79d4 Tony Camuso     2019-08-22  4469  =

383035211c79d4 Tony Camuso     2019-08-22  4470  		if (intf->in_shutdown)
059747c245f0e9 Corey Minyard   2021-09-24  4471  			goto out;
383035211c79d4 Tony Camuso     2019-08-22  4472  =

383035211c79d4 Tony Camuso     2019-08-22  4473  		/*
383035211c79d4 Tony Camuso     2019-08-22  4474  		 * This is the local res=
ponse to a command send, start
383035211c79d4 Tony Camuso     2019-08-22  4475  		 * the timer for these. =
 The user_data will not be
383035211c79d4 Tony Camuso     2019-08-22  4476  		 * NULL if this is a res=
ponse send, and we will let
383035211c79d4 Tony Camuso     2019-08-22  4477  		 * response sends just g=
o through.
383035211c79d4 Tony Camuso     2019-08-22  4478  		 */
383035211c79d4 Tony Camuso     2019-08-22  4479  =

383035211c79d4 Tony Camuso     2019-08-22  4480  		/*
383035211c79d4 Tony Camuso     2019-08-22  4481  		 * Check for errors, if =
we get certain errors (ones
383035211c79d4 Tony Camuso     2019-08-22  4482  		 * that mean basically w=
e can try again later), we
383035211c79d4 Tony Camuso     2019-08-22  4483  		 * ignore them and start=
 the timer.  Otherwise we
383035211c79d4 Tony Camuso     2019-08-22  4484  		 * report the error imme=
diately.
383035211c79d4 Tony Camuso     2019-08-22  4485  		 */
383035211c79d4 Tony Camuso     2019-08-22  4486  		if ((msg->rsp_size >=3D =
3) && (msg->rsp[2] !=3D 0)
383035211c79d4 Tony Camuso     2019-08-22  4487  		    && (msg->rsp[2] !=3D=
 IPMI_NODE_BUSY_ERR)
383035211c79d4 Tony Camuso     2019-08-22  4488  		    && (msg->rsp[2] !=3D=
 IPMI_LOST_ARBITRATION_ERR)
383035211c79d4 Tony Camuso     2019-08-22  4489  		    && (msg->rsp[2] !=3D=
 IPMI_BUS_ERR)
383035211c79d4 Tony Camuso     2019-08-22  4490  		    && (msg->rsp[2] !=3D=
 IPMI_NAK_ON_WRITE_ERR)) {
383035211c79d4 Tony Camuso     2019-08-22  4491  			int ch =3D msg->rsp[3] =
& 0xf;
383035211c79d4 Tony Camuso     2019-08-22  4492  			struct ipmi_channel *ch=
ans;
383035211c79d4 Tony Camuso     2019-08-22  4493  =

383035211c79d4 Tony Camuso     2019-08-22  4494  			/* Got an error sending=
 the message, handle it. */
383035211c79d4 Tony Camuso     2019-08-22  4495  =

383035211c79d4 Tony Camuso     2019-08-22  4496  			chans =3D READ_ONCE(int=
f->channel_list)->c;
383035211c79d4 Tony Camuso     2019-08-22  4497  			if ((chans[ch].medium =
=3D=3D IPMI_CHANNEL_MEDIUM_8023LAN)
383035211c79d4 Tony Camuso     2019-08-22  4498  			    || (chans[ch].mediu=
m =3D=3D IPMI_CHANNEL_MEDIUM_ASYNC))
383035211c79d4 Tony Camuso     2019-08-22  4499  				ipmi_inc_stat(intf, se=
nt_lan_command_errs);
383035211c79d4 Tony Camuso     2019-08-22  4500  			else
383035211c79d4 Tony Camuso     2019-08-22  4501  				ipmi_inc_stat(intf, se=
nt_ipmb_command_errs);
383035211c79d4 Tony Camuso     2019-08-22  4502  			intf_err_seq(intf, msg-=
>msgid, msg->rsp[2]);
383035211c79d4 Tony Camuso     2019-08-22  4503  		} else
383035211c79d4 Tony Camuso     2019-08-22  4504  			/* The message was sent=
, start the timer. */
383035211c79d4 Tony Camuso     2019-08-22  4505  			intf_start_seq_timer(in=
tf, msg->msgid);
c70d749986f6f1 Corey Minyard   2008-04-29  4506  	} else if (((msg->rsp[0] =
>> 2) !=3D ((msg->data[0] >> 2) | 1))
c70d749986f6f1 Corey Minyard   2008-04-29  4507  		   || (msg->rsp[1] !=3D =
msg->data[1])) {
c70d749986f6f1 Corey Minyard   2008-04-29  4508  		/*
c70d749986f6f1 Corey Minyard   2008-04-29  4509  		 * The NetFN and Command=
 in the response is not even
c70d749986f6f1 Corey Minyard   2008-04-29  4510  		 * marginally correct.
c70d749986f6f1 Corey Minyard   2008-04-29  4511  		 */
106a846102b86a Corey Minyard   2017-09-18  4512  		dev_warn(intf->si_dev,
445e2cbda928a3 Joe Perches     2018-05-09  4513  			 "BMC returned incorrec=
t response, expected netfn %x cmd %x, got netfn %x cmd %x\n",
^1da177e4c3f41 Linus Torvalds  2005-04-16  4514  			 (msg->data[0] >> 2) | =
1, msg->data[1],
^1da177e4c3f41 Linus Torvalds  2005-04-16  4515  			 msg->rsp[0] >> 2, msg-=
>rsp[1]);
^1da177e4c3f41 Linus Torvalds  2005-04-16  4516  =

059747c245f0e9 Corey Minyard   2021-09-24  4517  		goto return_unspecified;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4518  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  4519  =

059747c245f0e9 Corey Minyard   2021-09-24  4520  	if (msg->type =3D=3D IPMI=
_SMI_MSG_TYPE_IPMB_DIRECT) {
059747c245f0e9 Corey Minyard   2021-09-24  4521  		if ((msg->data[0] >> 2) =
& 1) {
059747c245f0e9 Corey Minyard   2021-09-24  4522  			/* It's a response to a=
 sent response. */
059747c245f0e9 Corey Minyard   2021-09-24 @4523  			chan =3D 0;
059747c245f0e9 Corey Minyard   2021-09-24  4524  			cc =3D msg->rsp[4];
059747c245f0e9 Corey Minyard   2021-09-24  4525  			goto process_response_r=
esponse;
059747c245f0e9 Corey Minyard   2021-09-24  4526  		}
059747c245f0e9 Corey Minyard   2021-09-24  4527  		if (is_cmd)
059747c245f0e9 Corey Minyard   2021-09-24  4528  			requeue =3D handle_ipmb=
_direct_rcv_cmd(intf, msg);
059747c245f0e9 Corey Minyard   2021-09-24  4529  		else
059747c245f0e9 Corey Minyard   2021-09-24  4530  			requeue =3D handle_ipmb=
_direct_rcv_rsp(intf, msg);
059747c245f0e9 Corey Minyard   2021-09-24  4531  	} else if ((msg->rsp[0] =
=3D=3D ((IPMI_NETFN_APP_REQUEST|1) << 2))
^1da177e4c3f41 Linus Torvalds  2005-04-16  4532  		   && (msg->rsp[1] =3D=
=3D IPMI_SEND_MSG_CMD)
c70d749986f6f1 Corey Minyard   2008-04-29  4533  		   && (msg->user_data !=
=3D NULL)) {
c70d749986f6f1 Corey Minyard   2008-04-29  4534  		/*
c70d749986f6f1 Corey Minyard   2008-04-29  4535  		 * It's a response to a =
response we sent.  For this we
c70d749986f6f1 Corey Minyard   2008-04-29  4536  		 * deliver a send messag=
e response to the user.
c70d749986f6f1 Corey Minyard   2008-04-29  4537  		 */
059747c245f0e9 Corey Minyard   2021-09-24  4538  		struct ipmi_recv_msg *re=
cv_msg;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4539  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  4540  		chan =3D msg->data[2] & =
0x0f;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4541  		if (chan >=3D IPMI_MAX_C=
HANNELS)
^1da177e4c3f41 Linus Torvalds  2005-04-16  4542  			/* Invalid channel numb=
er */
^1da177e4c3f41 Linus Torvalds  2005-04-16  4543  			goto out;
059747c245f0e9 Corey Minyard   2021-09-24  4544  		cc =3D msg->rsp[2];
^1da177e4c3f41 Linus Torvalds  2005-04-16  4545  =

059747c245f0e9 Corey Minyard   2021-09-24  4546  process_response_response:
059747c245f0e9 Corey Minyard   2021-09-24  4547  		recv_msg =3D msg->user_d=
ata;
059747c245f0e9 Corey Minyard   2021-09-24  4548  =

059747c245f0e9 Corey Minyard   2021-09-24  4549  		requeue =3D 0;
393d2cc354d150 Corey Minyard   2005-11-07  4550  		if (!recv_msg)
393d2cc354d150 Corey Minyard   2005-11-07  4551  			goto out;
393d2cc354d150 Corey Minyard   2005-11-07  4552  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  4553  		recv_msg->recv_type =3D =
IPMI_RESPONSE_RESPONSE_TYPE;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4554  		recv_msg->msg.data =3D r=
ecv_msg->msg_data;
059747c245f0e9 Corey Minyard   2021-09-24  4555  		recv_msg->msg_data[0] =
=3D cc;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4556  		recv_msg->msg.data_len =
=3D 1;
ac93bd0c9e163f Corey Minyard   2018-04-05  4557  		deliver_local_response(i=
ntf, recv_msg);
^1da177e4c3f41 Linus Torvalds  2005-04-16  4558  	} else if ((msg->rsp[0] =
=3D=3D ((IPMI_NETFN_APP_REQUEST|1) << 2))
c70d749986f6f1 Corey Minyard   2008-04-29  4559  		   && (msg->rsp[1] =3D=
=3D IPMI_GET_MSG_CMD)) {
31b0b0730ad2a8 Corey Minyard   2017-09-06  4560  		struct ipmi_channel   *c=
hans;
31b0b0730ad2a8 Corey Minyard   2017-09-06  4561  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  4562  		/* It's from the receive=
 queue. */
^1da177e4c3f41 Linus Torvalds  2005-04-16  4563  		chan =3D msg->rsp[3] & 0=
xf;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4564  		if (chan >=3D IPMI_MAX_C=
HANNELS) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  4565  			/* Invalid channel numb=
er */
^1da177e4c3f41 Linus Torvalds  2005-04-16  4566  			requeue =3D 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4567  			goto out;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4568  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  4569  =

4dec302ff71ebf dann frazier    2009-04-21  4570  		/*
9a2845c453d170 Corey Minyard   2009-05-20  4571  		 * We need to make sure =
the channels have been initialized.
9a2845c453d170 Corey Minyard   2009-05-20  4572  		 * The channel_handler r=
outine will set the "curr_channel"
9a2845c453d170 Corey Minyard   2009-05-20  4573  		 * equal to or greater t=
han IPMI_MAX_CHANNELS when all the
9a2845c453d170 Corey Minyard   2009-05-20  4574  		 * channels for this int=
erface have been initialized.
4dec302ff71ebf dann frazier    2009-04-21  4575  		 */
31b0b0730ad2a8 Corey Minyard   2017-09-06  4576  		if (!intf->channels_read=
y) {
9a2845c453d170 Corey Minyard   2009-05-20  4577  			requeue =3D 0; /* Throw=
 the message away */
4dec302ff71ebf dann frazier    2009-04-21  4578  			goto out;
4dec302ff71ebf dann frazier    2009-04-21  4579  		}
4dec302ff71ebf dann frazier    2009-04-21  4580  =

31b0b0730ad2a8 Corey Minyard   2017-09-06  4581  		chans =3D READ_ONCE(intf=
->channel_list)->c;
31b0b0730ad2a8 Corey Minyard   2017-09-06  4582  =

31b0b0730ad2a8 Corey Minyard   2017-09-06  4583  		switch (chans[chan].medi=
um) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  4584  		case IPMI_CHANNEL_MEDIUM=
_IPMB:
^1da177e4c3f41 Linus Torvalds  2005-04-16  4585  			if (msg->rsp[4] & 0x04)=
 {
c70d749986f6f1 Corey Minyard   2008-04-29  4586  				/*
c70d749986f6f1 Corey Minyard   2008-04-29  4587  				 * It's a response, so=
 find the
c70d749986f6f1 Corey Minyard   2008-04-29  4588  				 * requesting message =
and send it up.
c70d749986f6f1 Corey Minyard   2008-04-29  4589  				 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  4590  				requeue =3D handle_ipm=
b_get_msg_rsp(intf, msg);
^1da177e4c3f41 Linus Torvalds  2005-04-16  4591  			} else {
c70d749986f6f1 Corey Minyard   2008-04-29  4592  				/*
c70d749986f6f1 Corey Minyard   2008-04-29  4593  				 * It's a command to t=
he SMS from some other
c70d749986f6f1 Corey Minyard   2008-04-29  4594  				 * entity.  Handle tha=
t.
c70d749986f6f1 Corey Minyard   2008-04-29  4595  				 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  4596  				requeue =3D handle_ipm=
b_get_msg_cmd(intf, msg);
^1da177e4c3f41 Linus Torvalds  2005-04-16  4597  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  4598  			break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4599  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  4600  		case IPMI_CHANNEL_MEDIUM=
_8023LAN:
^1da177e4c3f41 Linus Torvalds  2005-04-16  4601  		case IPMI_CHANNEL_MEDIUM=
_ASYNC:
^1da177e4c3f41 Linus Torvalds  2005-04-16  4602  			if (msg->rsp[6] & 0x04)=
 {
c70d749986f6f1 Corey Minyard   2008-04-29  4603  				/*
c70d749986f6f1 Corey Minyard   2008-04-29  4604  				 * It's a response, so=
 find the
c70d749986f6f1 Corey Minyard   2008-04-29  4605  				 * requesting message =
and send it up.
c70d749986f6f1 Corey Minyard   2008-04-29  4606  				 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  4607  				requeue =3D handle_lan=
_get_msg_rsp(intf, msg);
^1da177e4c3f41 Linus Torvalds  2005-04-16  4608  			} else {
c70d749986f6f1 Corey Minyard   2008-04-29  4609  				/*
c70d749986f6f1 Corey Minyard   2008-04-29  4610  				 * It's a command to t=
he SMS from some other
c70d749986f6f1 Corey Minyard   2008-04-29  4611  				 * entity.  Handle tha=
t.
c70d749986f6f1 Corey Minyard   2008-04-29  4612  				 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  4613  				requeue =3D handle_lan=
_get_msg_cmd(intf, msg);
^1da177e4c3f41 Linus Torvalds  2005-04-16  4614  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  4615  			break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4616  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  4617  		default:
4dec302ff71ebf dann frazier    2009-04-21  4618  			/* Check for OEM Channe=
ls.  Clients had better
4dec302ff71ebf dann frazier    2009-04-21  4619  			   register for these c=
ommands. */
31b0b0730ad2a8 Corey Minyard   2017-09-06  4620  			if ((chans[chan].medium=
 >=3D IPMI_CHANNEL_MEDIUM_OEM_MIN)
31b0b0730ad2a8 Corey Minyard   2017-09-06  4621  			    && (chans[chan].med=
ium
4dec302ff71ebf dann frazier    2009-04-21  4622  				<=3D IPMI_CHANNEL_MEDI=
UM_OEM_MAX)) {
4dec302ff71ebf dann frazier    2009-04-21  4623  				requeue =3D handle_oem=
_get_msg_cmd(intf, msg);
4dec302ff71ebf dann frazier    2009-04-21  4624  			} else {
c70d749986f6f1 Corey Minyard   2008-04-29  4625  				/*
c70d749986f6f1 Corey Minyard   2008-04-29  4626  				 * We don't handle the=
 channel type, so just
c70d749986f6f1 Corey Minyard   2008-04-29  4627  				 * free the message.
c70d749986f6f1 Corey Minyard   2008-04-29  4628  				 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  4629  				requeue =3D 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4630  			}
4dec302ff71ebf dann frazier    2009-04-21  4631  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  4632  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  4633  	} else if ((msg->rsp[0] =
=3D=3D ((IPMI_NETFN_APP_REQUEST|1) << 2))
c70d749986f6f1 Corey Minyard   2008-04-29  4634  		   && (msg->rsp[1] =3D=
=3D IPMI_READ_EVENT_MSG_BUFFER_CMD)) {
b3834be5c42a5d Adam Buchbinder 2012-09-19  4635  		/* It's an asynchronous =
event. */
^1da177e4c3f41 Linus Torvalds  2005-04-16  4636  		requeue =3D handle_read_=
event_rsp(intf, msg);
^1da177e4c3f41 Linus Torvalds  2005-04-16  4637  	} else {
^1da177e4c3f41 Linus Torvalds  2005-04-16  4638  		/* It's a response from =
the local BMC. */
^1da177e4c3f41 Linus Torvalds  2005-04-16  4639  		requeue =3D handle_bmc_r=
sp(intf, msg);
^1da177e4c3f41 Linus Torvalds  2005-04-16  4640  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  4641  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  4642   out:
^1da177e4c3f41 Linus Torvalds  2005-04-16  4643  	return requeue;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4644  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  4645  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4929430144204115535==--

