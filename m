Content-Type: multipart/mixed; boundary="===============2673036776285413563=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/media/av7110/av7110_av.c:638:2: warning: Value stored to 'c2' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 27 Dec 2021 02:15:40 +0800
Message-ID: <202112270225.IdnqnOEz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2673036776285413563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   438645193e59e91761ccb3fa55f6ce70b615ff93
commit: 989cf18ed08f8b6efd1d1592d1d0108fa09b98f5 media: av7110: move driver=
 to staging
date:   7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20211226 (https://download.01.org/0day-ci/archi=
ve/20211227/202112270225.IdnqnOEz-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1=
ee7fd44b53c555a7823ae8fd1a8209c520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D989cf18ed08f8b6efd1d1592d1d0108fa09b98f5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 989cf18ed08f8b6efd1d1592d1d0108fa09b98f5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                      ^
   drivers/vme/vme.c:1481:8: note: Taking false branch
                   lm =3D list_entry(lm_pos,
                        ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/vme/vme.c:1481:8: note: Loop condition is false.  Exiting loop
                   lm =3D list_entry(lm_pos,
                        ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/vme/vme.c:1483:7: note: Assuming 'lm' is null
                   if (!lm) {
                       ^~~
   drivers/vme/vme.c:1483:3: note: Taking true branch
                   if (!lm) {
                   ^
   drivers/vme/vme.c:1485:4: note:  Execution continues on line 1480
                           continue;
                           ^
   drivers/vme/vme.c:1480:16: note: Access to field 'next' results in a der=
eference of a null pointer (loaded from variable 'lm_pos')
           list_for_each(lm_pos, &bridge->lm_resources) {
                         ^
   include/linux/list.h:571:48: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; pos !=3D (head); pos =3D pos->next)
                                                         ^~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/staging/media/av7110/av7110_av.c:638:2: warning: Value stored to=
 'c2' is never read [clang-analyzer-deadcode.DeadStores]
           c2 =3D 0;
           ^    ~
   drivers/staging/media/av7110/av7110_av.c:638:2: note: Value stored to 'c=
2' is never read
           c2 =3D 0;
           ^    ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/input/misc/iqs269a.c:1118:12: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   dir_mask =3D flags.states[IQS269_ST_OFFS_DIR];
                            ^
   drivers/input/misc/iqs269a.c:1643:6: note: Assuming 'iqs269' is non-null
           if (!iqs269)
               ^~~~~~~
   drivers/input/misc/iqs269a.c:1643:2: note: Taking false branch
           if (!iqs269)
           ^
   drivers/input/misc/iqs269a.c:1646:2: note: Calling 'i2c_set_clientdata'
           i2c_set_clientdata(client, iqs269);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:364:2: note: Calling 'dev_set_drvdata'
           dev_set_drvdata(&client->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:674:1: note: Returning without writing to 'data->=
keypad', which participates in a condition later
   }
   ^
   include/linux/device.h:674:1: note: Returning without writing to 'data->=
hall_enable', which participates in a condition later
   include/linux/i2c.h:364:2: note: Returning from 'dev_set_drvdata'
           dev_set_drvdata(&client->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:365:1: note: Returning without writing to 'data->key=
pad', which participates in a condition later
   }
   ^
   include/linux/i2c.h:365:1: note: Returning without writing to 'data->hal=
l_enable', which participates in a condition later
   drivers/input/misc/iqs269a.c:1646:2: note: Returning from 'i2c_set_clien=
tdata'
           i2c_set_clientdata(client, iqs269);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/iqs269a.c:1650:2: note: Taking false branch
           if (IS_ERR(iqs269->regmap)) {
           ^

vim +/c2 +638 drivers/staging/media/av7110/av7110_av.c

^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  631  =

^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  632  void av7110_p2t_write(u8 const *buf, long int length, u16 pid, stru=
ct av7110_p2t *p)
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  633  {
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  634  	int c, c2, l, add;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  635  	int check, rest;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  636  =

^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  637  	c =3D 0;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6 @638  	c2 =3D 0;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  639  	if (p->frags){
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  640  		check =3D 0;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  641  		switch(p->frags) {
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  642  		case 1:
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  643  			if (buf[c] =3D=3D 0x00 && buf[c + 1] =3D=3D 0x01) {
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  644  				check =3D 1;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  645  				c +=3D 2;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  646  			}
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  647  			break;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  648  		case 2:
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  649  			if (buf[c] =3D=3D 0x01) {
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  650  				check =3D 1;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  651  				c++;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  652  			}
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  653  			break;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  654  		case 3:
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  655  			check =3D 1;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  656  		}
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  657  		if (check) {
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  658  			switch (buf[c]) {
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  659  			case PROG_STREAM_MAP:
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  660  			case PRIVATE_STREAM2:
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  661  			case PROG_STREAM_DIR:
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  662  			case ECM_STREAM     :
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  663  			case EMM_STREAM     :
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  664  			case PADDING_STREAM :
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  665  			case DSM_CC_STREAM  :
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  666  			case ISO13522_STREAM:
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  667  			case PRIVATE_STREAM1:
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  668  			case AUDIO_STREAM_S ... AUDIO_STREAM_E:
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  669  			case VIDEO_STREAM_S ... VIDEO_STREAM_E:
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  670  				p->pes[0] =3D 0x00;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  671  				p->pes[1] =3D 0x00;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  672  				p->pes[2] =3D 0x01;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  673  				p->pes[3] =3D buf[c];
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  674  				p->pos =3D 4;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  675  				memcpy(p->pes + p->pos, buf + c, (TS_SIZE - 4) - p->pos);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  676  				c +=3D (TS_SIZE - 4) - p->pos;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  677  				p_to_t(p->pes, (TS_SIZE - 4), pid, &p->counter, p->feed);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  678  				clear_p2t(p);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  679  				break;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  680  =

^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  681  			default:
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  682  				c =3D 0;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  683  				break;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  684  			}
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  685  		}
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  686  		p->frags =3D 0;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  687  	}
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  688  =

^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  689  	if (p->pos) {
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  690  		c2 =3D find_pes_header(buf + c, length - c, &p->frags);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  691  		if (c2 >=3D 0 && c2 < (TS_SIZE - 4) - p->pos)
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  692  			l =3D c2+c;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  693  		else
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  694  			l =3D (TS_SIZE - 4) - p->pos;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  695  		memcpy(p->pes + p->pos, buf, l);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  696  		c +=3D l;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  697  		p->pos +=3D l;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  698  		p_to_t(p->pes, p->pos, pid, &p->counter, p->feed);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  699  		clear_p2t(p);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  700  	}
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  701  =

^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  702  	add =3D 0;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  703  	while (c < length) {
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  704  		c2 =3D find_pes_header(buf + c + add, length - c - add, &p->frags=
);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  705  		if (c2 >=3D 0) {
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  706  			c2 +=3D c + add;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  707  			if (c2 > c){
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  708  				p_to_t(buf + c, c2 - c, pid, &p->counter, p->feed);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  709  				c =3D c2;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  710  				clear_p2t(p);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  711  				add =3D 0;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  712  			} else
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  713  				add =3D 1;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  714  		} else {
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  715  			l =3D length - c;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  716  			rest =3D l % (TS_SIZE - 4);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  717  			l -=3D rest;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  718  			p_to_t(buf + c, l, pid, &p->counter, p->feed);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  719  			memcpy(p->pes, buf + c + l, rest);
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  720  			p->pos =3D rest;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  721  			c =3D length;
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  722  		}
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  723  	}
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  724  }
^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_av.c Linus Torvalds 2005-04-1=
6  725  =


:::::: The code at line 638 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2673036776285413563==--

