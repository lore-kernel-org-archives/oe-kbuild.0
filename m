Content-Type: multipart/mixed; boundary="===============7839457325629259039=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cminyard-ipmi:for-next 2/12] drivers/char/ipmi/ipmi_msghandler.c:945:15: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Tue, 19 Apr 2022 04:45:53 +0800
Message-ID: <202204190449.m22dzWVB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7839457325629259039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Corey Minyard <cminyard@mvista.com>

tree:   https://github.com/cminyard/linux-ipmi for-next
head:   af82f0f557885a3c021e756230b48de5c4c76347
commit: e622399b18f8efe2e7dd89017b81fa202e44ddf8 [2/12] ipmi: Limit the num=
ber of message a user may have outstanding
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220418 (https://download.01.org/0day-ci/archi=
ve/20220419/202204190449.m22dzWVB-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cba=
c0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/cminyard/linux-ipmi/commit/e622399b18f8efe2e7d=
d89017b81fa202e44ddf8
        git remote add cminyard-ipmi https://github.com/cminyard/linux-ipmi
        git fetch --no-tags cminyard-ipmi for-next
        git checkout e622399b18f8efe2e7dd89017b81fa202e44ddf8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:733:2: warning: Attempt to free rele=
ased memory [clang-analyzer-unix.Malloc]
           kfree(intf);
           ^
   drivers/char/ipmi/ipmi_msghandler.c:3514:6: note: Assuming field 'in_shu=
tdown' is false
           if (!intf->in_shutdown)
               ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3514:2: note: Taking true branch
           if (!intf->in_shutdown)
           ^
   drivers/char/ipmi/ipmi_msghandler.c:3515:3: note: Calling 'bmc_get_devic=
e_id'
                   bmc_get_device_id(intf, NULL, NULL, NULL, NULL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2741:9: note: Calling '__bmc_get_dev=
ice_id'
           return __bmc_get_device_id(intf, bmc, id, guid_set, guid, -1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2610:18: note: 'intf' is not equal t=
o NULL
           bool intf_set =3D intf !=3D NULL;
                           ^~~~
   drivers/char/ipmi/ipmi_msghandler.c:2612:7: note: 'intf' is non-null
           if (!intf) {
                ^~~~
   drivers/char/ipmi/ipmi_msghandler.c:2612:2: note: Taking false branch
           if (!intf) {
           ^
   drivers/char/ipmi/ipmi_msghandler.c:2639:6: note: Assuming field 'in_bmc=
_register' is true
           if (intf->in_bmc_register ||
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2639:28: note: Left side of '||' is =
true
           if (intf->in_bmc_register ||
                                     ^
   drivers/char/ipmi/ipmi_msghandler.c:2641:3: note: Control jumps to line =
2719
                   goto out_noprocessing;
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:2719:7: note: 'rv' is 0
           if (!rv) {
                ^~
   drivers/char/ipmi/ipmi_msghandler.c:2719:2: note: Taking true branch
           if (!rv) {
           ^
   drivers/char/ipmi/ipmi_msghandler.c:2720:7: note: 'id' is null
                   if (id)
                       ^~
   drivers/char/ipmi/ipmi_msghandler.c:2720:3: note: Taking false branch
                   if (id)
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:2723:7: note: 'guid_set' is null
                   if (guid_set)
                       ^~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2723:3: note: Taking false branch
                   if (guid_set)
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:2726:7: note: 'guid' is null
                   if (guid && bmc->dyn_guid_set)
                       ^~~~
   drivers/char/ipmi/ipmi_msghandler.c:2726:12: note: Left side of '&&' is =
false
                   if (guid && bmc->dyn_guid_set)
                            ^
   drivers/char/ipmi/ipmi_msghandler.c:2733:2: note: Calling 'kref_put'
           kref_put(&intf->refcount, intf_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'intf_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:733:2: note: Memory is released
           kfree(intf);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2733:2: note: Returning; memory was =
released
           kref_put(&intf->refcount, intf_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2741:9: note: Returning; memory was =
released
           return __bmc_get_device_id(intf, bmc, id, guid_set, guid, -1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3515:3: note: Returning; memory was =
released
                   bmc_get_device_id(intf, NULL, NULL, NULL, NULL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3517:2: note: Calling 'kref_put'
           kref_put(&intf->refcount, intf_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'intf_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:733:2: note: Attempt to free release=
d memory
           kfree(intf);
           ^~~~~~~~~~~
>> drivers/char/ipmi/ipmi_msghandler.c:945:15: warning: Use of memory after=
 it is freed [clang-analyzer-unix.Malloc]
                   atomic_dec(&msg->user->nr_msgs);
                               ^
   drivers/char/ipmi/ipmi_msghandler.c:3948:6: note: Assuming 'rcvr' is non=
-null
           if (rcvr) {
               ^~~~
   drivers/char/ipmi/ipmi_msghandler.c:3948:2: note: Taking true branch
           if (rcvr) {
           ^
   drivers/char/ipmi/ipmi_msghandler.c:3955:6: note: Assuming 'user' is not=
 equal to NULL
           if (user =3D=3D NULL) {
               ^~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3955:2: note: Taking false branch
           if (user =3D=3D NULL) {
           ^
   drivers/char/ipmi/ipmi_msghandler.c:3980:14: note: Calling 'ipmi_alloc_r=
ecv_msg'
                   recv_msg =3D ipmi_alloc_recv_msg();
                              ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:5105:6: note: Assuming 'rv' is non-n=
ull
           if (rv) {
               ^~
   drivers/char/ipmi/ipmi_msghandler.c:5105:2: note: Taking true branch
           if (rv) {
           ^
   drivers/char/ipmi/ipmi_msghandler.c:3980:14: note: Returning from 'ipmi_=
alloc_recv_msg'
                   recv_msg =3D ipmi_alloc_recv_msg();
                              ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3981:8: note: 'recv_msg' is non-null
                   if (!recv_msg) {
                        ^~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3981:3: note: Taking false branch
                   if (!recv_msg) {
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:4012:8: note: Calling 'deliver_respo=
nse'
                           if (deliver_response(intf, recv_msg))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:929:12: note: Field 'user' is non-nu=
ll
           if (!msg->user) {
                     ^
   drivers/char/ipmi/ipmi_msghandler.c:929:2: note: Taking false branch
           if (!msg->user) {
           ^
   drivers/char/ipmi/ipmi_msghandler.c:938:13: note: Assuming 'oops_in_prog=
ress' is not equal to 0
           } else if (oops_in_progress) {
                      ^~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:938:9: note: Taking true branch
           } else if (oops_in_progress) {
                  ^
   drivers/char/ipmi/ipmi_msghandler.c:944:3: note: Calling 'ipmi_free_recv=
_msg'
                   ipmi_free_recv_msg(msg);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:5115:11: note: Field 'user' is non-n=
ull
           if (msg->user && !oops_in_progress)
                    ^
   drivers/char/ipmi/ipmi_msghandler.c:5115:6: note: Left side of '&&' is t=
rue
           if (msg->user && !oops_in_progress)
               ^
   drivers/char/ipmi/ipmi_msghandler.c:5115:20: note: 'oops_in_progress' is=
 not equal to 0
           if (msg->user && !oops_in_progress)
                             ^~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:5115:2: note: Taking false branch
           if (msg->user && !oops_in_progress)
           ^
   drivers/char/ipmi/ipmi_msghandler.c:5117:2: note: Calling 'free_recv_msg'
           msg->done(msg);
           ^~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:5096:6: note: Assuming 'oops_in_prog=
ress' is 0
           if (!oops_in_progress)
               ^~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:5096:2: note: Taking true branch
           if (!oops_in_progress)
           ^
   drivers/char/ipmi/ipmi_msghandler.c:5097:3: note: Memory is released
                   kfree(msg);
                   ^~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:5117:2: note: Returning; memory was =
released via 1st parameter
           msg->done(msg);
           ^~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:944:3: note: Returning; memory was r=
eleased via 1st parameter
                   ipmi_free_recv_msg(msg);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:945:15: note: Use of memory after it=
 is freed
                   atomic_dec(&msg->user->nr_msgs);
                               ^~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:1814:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&smi_msg->data[i + 9], msg->data, msg->data_len);
                   ^~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:1814:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&smi_msg->data[i + 9], msg->data, msg->data_len);
                   ^~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:1851:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&smi_msg->data[10], msg->data, msg->data_len);
                   ^~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:1851:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&smi_msg->data[10], msg->data, msg->data_len);
                   ^~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:1931:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&recv_msg->addr, smi_addr, sizeof(*smi_addr));
           ^~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:1931:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&recv_msg->addr, smi_addr, sizeof(*smi_addr));

vim +945 drivers/char/ipmi/ipmi_msghandler.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  924  =

ac93bd0c9e163f Corey Minyard  2018-04-05  925  static int deliver_response(=
struct ipmi_smi *intf, struct ipmi_recv_msg *msg)
^1da177e4c3f41 Linus Torvalds 2005-04-16  926  {
ac93bd0c9e163f Corey Minyard  2018-04-05  927  	int rv =3D 0;
56a55ec64806fb Corey Minyard  2005-09-06  928  =

ac93bd0c9e163f Corey Minyard  2018-04-05  929  	if (!msg->user) {
56a55ec64806fb Corey Minyard  2005-09-06  930  		/* Special handling for NU=
LL users. */
56a55ec64806fb Corey Minyard  2005-09-06  931  		if (intf->null_user_handle=
r) {
56a55ec64806fb Corey Minyard  2005-09-06  932  			intf->null_user_handler(i=
ntf, msg);
56a55ec64806fb Corey Minyard  2005-09-06  933  		} else {
56a55ec64806fb Corey Minyard  2005-09-06  934  			/* No handler, so give up=
. */
ac93bd0c9e163f Corey Minyard  2018-04-05  935  			rv =3D -EINVAL;
56a55ec64806fb Corey Minyard  2005-09-06  936  		}
56a55ec64806fb Corey Minyard  2005-09-06  937  		ipmi_free_recv_msg(msg);
2033f6858970b9 Corey Minyard  2019-08-16  938  	} else if (oops_in_progress=
) {
c49c097610fe1a Hidehiro Kawai 2015-07-27  939  		/*
c49c097610fe1a Hidehiro Kawai 2015-07-27  940  		 * If we are running in th=
e panic context, calling the
c49c097610fe1a Hidehiro Kawai 2015-07-27  941  		 * receive handler doesn't=
 much meaning and has a deadlock
c49c097610fe1a Hidehiro Kawai 2015-07-27  942  		 * risk.  At this moment, =
simply skip it in that case.
c49c097610fe1a Hidehiro Kawai 2015-07-27  943  		 */
2033f6858970b9 Corey Minyard  2019-08-16  944  		ipmi_free_recv_msg(msg);
e622399b18f8ef Corey Minyard  2022-03-28 @945  		atomic_dec(&msg->user->nr_=
msgs);
2033f6858970b9 Corey Minyard  2019-08-16  946  	} else {
e86ee2d44b4405 Corey Minyard  2018-04-05  947  		int index;
e86ee2d44b4405 Corey Minyard  2018-04-05  948  		struct ipmi_user *user =3D=
 acquire_ipmi_user(msg->user, &index);
c49c097610fe1a Hidehiro Kawai 2015-07-27  949  =

e86ee2d44b4405 Corey Minyard  2018-04-05  950  		if (user) {
e622399b18f8ef Corey Minyard  2022-03-28  951  			atomic_dec(&user->nr_msgs=
);
393d2cc354d150 Corey Minyard  2005-11-07  952  			user->handler->ipmi_recv_=
hndl(msg, user->handler_data);
479d6b39b9e0d2 Fred Klassen   2019-01-19  953  			release_ipmi_user(user, i=
ndex);
e86ee2d44b4405 Corey Minyard  2018-04-05  954  		} else {
e86ee2d44b4405 Corey Minyard  2018-04-05  955  			/* User went away, give u=
p. */
e86ee2d44b4405 Corey Minyard  2018-04-05  956  			ipmi_free_recv_msg(msg);
e86ee2d44b4405 Corey Minyard  2018-04-05  957  			rv =3D -EINVAL;
e86ee2d44b4405 Corey Minyard  2018-04-05  958  		}
56a55ec64806fb Corey Minyard  2005-09-06  959  	}
ac93bd0c9e163f Corey Minyard  2018-04-05  960  =

ac93bd0c9e163f Corey Minyard  2018-04-05  961  	return rv;
^1da177e4c3f41 Linus Torvalds 2005-04-16  962  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  963  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7839457325629259039==--

