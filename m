Content-Type: multipart/mixed; boundary="===============3316800186790252904=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/input/misc/iqs7222.c:1404:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Wed, 01 Jun 2022 18:36:20 +0800
Message-ID: <202206011834.4jpDoCmK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3316800186790252904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/i=
nput/misc/iqs7222.c:1404:7: warning: Branch condition evaluates to a garbag=
e value [clang-analyzer-core.uninitialized.Branch]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jeff LaBundy <jeff@labundy.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   700170bf6b4d773e328fa54ebb70ba444007c702
commit: e505edaedcb9e7d16eefddc62d2189afaea0febc Input: add support for Azo=
teq IQS7222A/B/C
date:   8 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20220531 (https://download.01.org/0day-ci/archi=
ve/20220601/202206011834.4jpDoCmK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De505edaedcb9e7d16eefddc62d2189afaea0febc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e505edaedcb9e7d16eefddc62d2189afaea0febc
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           fbuf =3D list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   drivers/media/platform/rcar_drif.c:466:9: note: Taking false branch
           fbuf =3D list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/platform/rcar_drif.c:466:9: note: Loop condition is false.=
  Exiting loop
           fbuf =3D list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/platform/rcar_drif.c:466:9: note: Assuming 'pos__' is not =
equal to 'head__', which participates in a condition later
           fbuf =3D list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:555:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^~~~~~~~~~~~~~~
   drivers/media/platform/rcar_drif.c:466:9: note: '?' condition is true
           fbuf =3D list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:555:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^
   drivers/media/platform/rcar_drif.c:468:6: note: Assuming 'fbuf' is non-n=
ull, which participates in a condition later
           if (!fbuf) {
               ^~~~~
   drivers/media/platform/rcar_drif.c:468:2: note: Taking false branch
           if (!fbuf) {
           ^
   drivers/media/platform/rcar_drif.c:480:2: note: Returning pointer (loade=
d from 'fbuf'), which participates in a condition later
           return fbuf;
           ^~~~~~~~~~~
   drivers/media/platform/rcar_drif.c:579:9: note: Returning from 'rcar_dri=
f_get_fbuf'
           fbuf =3D rcar_drif_get_fbuf(sdr);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rcar_drif.c:580:7: note: 'fbuf' is non-null
           if (!fbuf)
                ^~~~
   drivers/media/platform/rcar_drif.c:580:2: note: Taking false branch
           if (!fbuf)
           ^
   drivers/media/platform/rcar_drif.c:583:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < RCAR_DRIF_MAX_CHANNEL; i++)
           ^
   drivers/media/platform/rcar_drif.c:583:41: note: The value 1 is assigned=
 to 'i'
           for (i =3D 0; i < RCAR_DRIF_MAX_CHANNEL; i++)
                                                  ^~~
   drivers/media/platform/rcar_drif.c:583:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < RCAR_DRIF_MAX_CHANNEL; i++)
           ^
   drivers/media/platform/rcar_drif.c:585:31: note: Access to field 'addr' =
results in a dereference of an undefined pointer value
                          i * sdr->hwbuf_size, buf[i]->addr, sdr->hwbuf_siz=
e);
                                               ^~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/input/misc/iqs7222.c:1404:7: warning: Branch condition evaluates=
 to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (error)
                       ^
   drivers/input/misc/iqs7222.c:2345:6: note: Assuming 'iqs7222' is non-null
           if (!iqs7222)
               ^~~~~~~~
   drivers/input/misc/iqs7222.c:2345:2: note: Taking false branch
           if (!iqs7222)
           ^
   drivers/input/misc/iqs7222.c:2352:6: note: Assuming field 'keypad' is no=
n-null
           if (!iqs7222->keypad)
               ^~~~~~~~~~~~~~~~
   drivers/input/misc/iqs7222.c:2352:2: note: Taking false branch
           if (!iqs7222->keypad)
           ^
   drivers/input/misc/iqs7222.c:2364:2: note: Taking false branch
           if (IS_ERR(iqs7222->irq_gpio)) {
           ^
   drivers/input/misc/iqs7222.c:2373:2: note: Taking false branch
           if (IS_ERR(iqs7222->reset_gpio)) {
           ^
   drivers/input/misc/iqs7222.c:2381:6: note: 'error' is 0
           if (error)
               ^~~~~
   drivers/input/misc/iqs7222.c:2381:2: note: Taking false branch
           if (error)
           ^
   drivers/input/misc/iqs7222.c:2385:6: note: 'error' is 0
           if (error)
               ^~~~~
   drivers/input/misc/iqs7222.c:2385:2: note: Taking false branch
           if (error)
           ^
   drivers/input/misc/iqs7222.c:2388:10: note: Calling 'iqs7222_dev_init'
           error =3D iqs7222_dev_init(iqs7222, READ);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/iqs7222.c:1334:6: note: 'error' declared without an i=
nitial value
           int error, i, j, k;
               ^~~~~
   drivers/input/misc/iqs7222.c:1341:6: note: Assuming 'comms_offset' is 0
           if (comms_offset) {
               ^~~~~~~~~~~~
   drivers/input/misc/iqs7222.c:1341:2: note: Taking false branch
           if (comms_offset) {
           ^
   drivers/input/misc/iqs7222.c:1357:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < IQS7222_NUM_REG_GRPS; i++) {
           ^
   drivers/input/misc/iqs7222.c:1364:7: note: Assuming 'num_col' is 0
                   if (!num_col)
                       ^~~~~~~~
   drivers/input/misc/iqs7222.c:1364:3: note: Taking true branch
                   if (!num_col)
                   ^
   drivers/input/misc/iqs7222.c:1365:4: note:  Execution continues on line =
1357
                           continue;
                           ^
   drivers/input/misc/iqs7222.c:1357:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < IQS7222_NUM_REG_GRPS; i++) {
           ^
   drivers/input/misc/iqs7222.c:1364:7: note: Assuming 'num_col' is not equ=
al to 0
                   if (!num_col)
                       ^~~~~~~~
   drivers/input/misc/iqs7222.c:1364:3: note: Taking false branch
                   if (!num_col)
                   ^
   drivers/input/misc/iqs7222.c:1367:9: note: Calling 'iqs7222_setup'
                   val =3D iqs7222_setup(iqs7222, i, 0);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/iqs7222.c:1015:2: note: Control jumps to 'case IQS722=
2_REG_GRP_CYCLE:' @line 1016
           switch (reg_grp) {
           ^
   drivers/input/misc/iqs7222.c:1017:3: note: Returning pointer, which part=
icipates in a condition later
                   return iqs7222->cycle_setup[row];
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/iqs7222.c:1367:9: note: Returning from 'iqs7222_setup'
                   val =3D iqs7222_setup(iqs7222, i, 0);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/iqs7222.c:1368:8: note: 'val' is non-null
                   if (!val)
                        ^~~
   drivers/input/misc/iqs7222.c:1368:3: note: Taking false branch
                   if (!val)
                   ^
   drivers/input/misc/iqs7222.c:1371:13: note: Calling 'kcalloc'
                   val_buf =3D kcalloc(num_col, sizeof(__le16), GFP_KERNEL);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:617:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:619:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:621:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);

vim +1404 drivers/input/misc/iqs7222.c

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1329  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1330  static int iqs7222_dev_init(s=
truct iqs7222_private *iqs7222, int dir)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1331  {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1332  	const struct iqs7222_dev_des=
c *dev_desc =3D iqs7222->dev_desc;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1333  	int comms_offset =3D dev_des=
c->comms_offset;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1334  	int error, i, j, k;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1335  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1336  	/*
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1337  	 * Take advantage of the sto=
p-bit disable function, if available, to
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1338  	 * save the trouble of havin=
g to reopen a communication window after
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1339  	 * each burst read or write.
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1340  	 */
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1341  	if (comms_offset) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1342  		u16 comms_setup;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1343  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1344  		error =3D iqs7222_read_word=
(iqs7222,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1345  					  IQS7222_SYS_SETUP + co=
mms_offset,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1346  					  &comms_setup);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1347  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1348  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1349  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1350  		error =3D iqs7222_write_wor=
d(iqs7222,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1351  					   IQS7222_SYS_SETUP + c=
omms_offset,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1352  					   comms_setup | IQS7222=
_COMMS_HOLD);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1353  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1354  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1355  	}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1356  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1357  	for (i =3D 0; i < IQS7222_NU=
M_REG_GRPS; i++) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1358  		int num_row =3D dev_desc->r=
eg_grps[i].num_row;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1359  		int num_col =3D dev_desc->r=
eg_grps[i].num_col;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1360  		u16 reg =3D dev_desc->reg_g=
rps[i].base;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1361  		__le16 *val_buf;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1362  		u16 *val;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1363  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1364  		if (!num_col)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1365  			continue;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1366  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1367  		val =3D iqs7222_setup(iqs72=
22, i, 0);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1368  		if (!val)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1369  			continue;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1370  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1371  		val_buf =3D kcalloc(num_col=
, sizeof(__le16), GFP_KERNEL);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1372  		if (!val_buf)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1373  			return -ENOMEM;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1374  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1375  		for (j =3D 0; j < num_row; =
j++) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1376  			switch (dir) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1377  			case READ:
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1378  				error =3D iqs7222_read_bu=
rst(iqs7222, reg,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1379  							   val_buf, num_col);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1380  				for (k =3D 0; k < num_col=
; k++)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1381  					val[k] =3D le16_to_cpu(v=
al_buf[k]);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1382  				break;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1383  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1384  			case WRITE:
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1385  				for (k =3D 0; k < num_col=
; k++)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1386  					val_buf[k] =3D cpu_to_le=
16(val[k]);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1387  				error =3D iqs7222_write_b=
urst(iqs7222, reg,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1388  							    val_buf, num_col);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1389  				break;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1390  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1391  			default:
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1392  				error =3D -EINVAL;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1393  			}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1394  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1395  			if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1396  				break;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1397  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1398  			reg +=3D IQS7222_REG_OFFSE=
T;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1399  			val +=3D iqs7222_max_cols[=
i];
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1400  		}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1401  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1402  		kfree(val_buf);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1403  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08 @1404  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1405  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1406  	}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1407  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1408  	if (comms_offset) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1409  		u16 comms_setup;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1410  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1411  		error =3D iqs7222_read_word=
(iqs7222,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1412  					  IQS7222_SYS_SETUP + co=
mms_offset,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1413  					  &comms_setup);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1414  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1415  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1416  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1417  		error =3D iqs7222_write_wor=
d(iqs7222,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1418  					   IQS7222_SYS_SETUP + c=
omms_offset,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1419  					   comms_setup & ~IQS722=
2_COMMS_HOLD);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1420  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1421  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1422  	}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1423  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1424  	if (dir =3D=3D READ)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1425  		return 0;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1426  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1427  	return iqs7222_ati_trigger(i=
qs7222);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1428  }
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1429  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3316800186790252904==--

