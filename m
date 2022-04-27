Content-Type: multipart/mixed; boundary="===============0571145624178576004=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [usb:usb-testing 7/77] drivers/usb/typec/tipd/core.c:455:18: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 27 Apr 2022 16:00:16 +0800
Message-ID: <202204271553.JWILxPoY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0571145624178576004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-usb(a)vger.kernel.org
TO: "Guido G=C3=BCnther" <agx@sigxcpu.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
head:   c40b62216c1aecc0dc00faf33d71bd71cb440337
commit: 92440202a88009ef66a236001981513e03a300fb [7/77] usb: typec: tipd: O=
nly update power status on IRQ
:::::: branch date: 20 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-c007-20220425 (https://download.01.org/0day-ci/ar=
chive/20220427/202204271553.JWILxPoY-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/co=
mmit/?id=3D92440202a88009ef66a236001981513e03a300fb
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/=
gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 92440202a88009ef66a236001981513e03a300fb
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:153:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&data[1], val, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:440:2: warning: 1st function call argument=
 is an uninitialized value [clang-analyzer-core.CallAndMessage]
           trace_tps6598x_data_status(data_status);
           ^
   drivers/usb/typec/tipd/core.c:531:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/usb/typec/tipd/core.c:531:2: note: Taking false branch
           if (ret) {
           ^
   drivers/usb/typec/tipd/core.c:537:6: note: Assuming the condition is fal=
se
           if (!(event1 | event2))
               ^~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:537:2: note: Taking false branch
           if (!(event1 | event2))
           ^
   drivers/usb/typec/tipd/core.c:540:2: note: Taking false branch
           if (!tps6598x_read_status(tps, &status))
           ^
   drivers/usb/typec/tipd/core.c:543:6: note: Assuming the condition is fal=
se
           if ((event1 | event2) & TPS_REG_INT_POWER_STATUS_UPDATE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:543:2: note: Taking false branch
           if ((event1 | event2) & TPS_REG_INT_POWER_STATUS_UPDATE)
           ^
   drivers/usb/typec/tipd/core.c:547:6: note: Assuming the condition is true
           if ((event1 | event2) & TPS_REG_INT_DATA_STATUS_UPDATE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:547:2: note: Taking true branch
           if ((event1 | event2) & TPS_REG_INT_DATA_STATUS_UPDATE)
           ^
   drivers/usb/typec/tipd/core.c:548:8: note: Calling 'tps6598x_read_data_s=
tatus'
                   if (!tps6598x_read_data_status(tps))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:432:2: note: 'data_status' declared withou=
t an initial value
           u32 data_status;
           ^~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:435:8: note: Calling 'tps6598x_read32'
           ret =3D tps6598x_read32(tps, TPS_REG_DATA_STATUS, &data_status);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:170:9: note: Calling 'tps6598x_block_read'
           return tps6598x_block_read(tps, reg, val, sizeof(u32));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:124:2: note: Taking false branch
           if (len + 1 > sizeof(data))
           ^
   drivers/usb/typec/tipd/core.c:127:12: note: Field 'i2c_protocol' is not =
equal to 0
           if (!tps->i2c_protocol)
                     ^
   drivers/usb/typec/tipd/core.c:127:2: note: Taking false branch
           if (!tps->i2c_protocol)
           ^
   drivers/usb/typec/tipd/core.c:131:6: note: Assuming 'ret' is not equal t=
o 0
           if (ret)
               ^~~
   drivers/usb/typec/tipd/core.c:131:2: note: Taking true branch
           if (ret)
           ^
   drivers/usb/typec/tipd/core.c:132:3: note: Returning without writing to =
'*val'
                   return ret;
                   ^
   drivers/usb/typec/tipd/core.c:170:9: note: Returning from 'tps6598x_bloc=
k_read'
           return tps6598x_block_read(tps, reg, val, sizeof(u32));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:170:2: note: Returning without writing to =
'*val'
           return tps6598x_block_read(tps, reg, val, sizeof(u32));
           ^
   drivers/usb/typec/tipd/core.c:435:8: note: Returning from 'tps6598x_read=
32'
           ret =3D tps6598x_read32(tps, TPS_REG_DATA_STATUS, &data_status);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:436:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/usb/typec/tipd/core.c:436:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/usb/typec/tipd/core.c:440:2: note: 1st function call argument is=
 an uninitialized value
           trace_tps6598x_data_status(data_status);
           ^                          ~~~~~~~~~~~
>> drivers/usb/typec/tipd/core.c:455:18: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
           tps->pwr_status =3D pwr_status;
                           ^
   drivers/usb/typec/tipd/core.c:531:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/usb/typec/tipd/core.c:531:2: note: Taking false branch
           if (ret) {
           ^
   drivers/usb/typec/tipd/core.c:537:6: note: Assuming the condition is fal=
se
           if (!(event1 | event2))
               ^~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:537:2: note: Taking false branch
           if (!(event1 | event2))
           ^
   drivers/usb/typec/tipd/core.c:540:2: note: Taking false branch
           if (!tps6598x_read_status(tps, &status))
           ^
   drivers/usb/typec/tipd/core.c:543:6: note: Assuming the condition is true
           if ((event1 | event2) & TPS_REG_INT_POWER_STATUS_UPDATE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:543:2: note: Taking true branch
           if ((event1 | event2) & TPS_REG_INT_POWER_STATUS_UPDATE)
           ^
   drivers/usb/typec/tipd/core.c:544:8: note: Calling 'tps6598x_read_power_=
status'
                   if (!tps6598x_read_power_status(tps))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:447:2: note: 'pwr_status' declared without=
 an initial value
           u16 pwr_status;
           ^~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:450:8: note: Calling 'tps6598x_read16'
           ret =3D tps6598x_read16(tps, TPS_REG_POWER_STATUS, &pwr_status);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:165:9: note: Calling 'tps6598x_block_read'
           return tps6598x_block_read(tps, reg, val, sizeof(u16));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:124:2: note: Taking false branch
           if (len + 1 > sizeof(data))
           ^
   drivers/usb/typec/tipd/core.c:127:12: note: Field 'i2c_protocol' is not =
equal to 0
           if (!tps->i2c_protocol)
                     ^
   drivers/usb/typec/tipd/core.c:127:2: note: Taking false branch
           if (!tps->i2c_protocol)
           ^
   drivers/usb/typec/tipd/core.c:131:6: note: Assuming 'ret' is not equal t=
o 0
           if (ret)
               ^~~
   drivers/usb/typec/tipd/core.c:131:2: note: Taking true branch
           if (ret)
           ^
   drivers/usb/typec/tipd/core.c:132:3: note: Returning without writing to =
'*val'
                   return ret;
                   ^
   drivers/usb/typec/tipd/core.c:165:9: note: Returning from 'tps6598x_bloc=
k_read'
           return tps6598x_block_read(tps, reg, val, sizeof(u16));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:165:2: note: Returning without writing to =
'*val'
           return tps6598x_block_read(tps, reg, val, sizeof(u16));
           ^
   drivers/usb/typec/tipd/core.c:450:8: note: Returning from 'tps6598x_read=
16'
           ret =3D tps6598x_read16(tps, TPS_REG_POWER_STATUS, &pwr_status);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:451:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/usb/typec/tipd/core.c:451:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/usb/typec/tipd/core.c:455:18: note: Assigned value is garbage or=
 undefined
           tps->pwr_status =3D pwr_status;
                           ^ ~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:514:6: warning: Branch condition evaluates=
 to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (event)
               ^~~~~
   drivers/usb/typec/tipd/core.c:477:2: note: 'event' declared without an i=
nitial value
           u64 event;
           ^~~~~~~~~
   drivers/usb/typec/tipd/core.c:483:8: note: Calling 'tps6598x_read64'
           ret =3D tps6598x_read64(tps, TPS_REG_INT_EVENT1, &event);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:175:9: note: Calling 'tps6598x_block_read'
           return tps6598x_block_read(tps, reg, val, sizeof(u64));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:124:2: note: Taking false branch
           if (len + 1 > sizeof(data))
           ^
   drivers/usb/typec/tipd/core.c:127:6: note: Assuming field 'i2c_protocol'=
 is not equal to 0
           if (!tps->i2c_protocol)
               ^~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:127:2: note: Taking false branch
           if (!tps->i2c_protocol)
           ^
   drivers/usb/typec/tipd/core.c:131:6: note: Assuming 'ret' is not equal t=
o 0
           if (ret)
               ^~~
   drivers/usb/typec/tipd/core.c:131:2: note: Taking true branch
           if (ret)
           ^
   drivers/usb/typec/tipd/core.c:132:3: note: Returning without writing to =
'*val'
                   return ret;

vim +455 drivers/usb/typec/tipd/core.c

0fbb79b7fd2c915 Sven Peter    2021-09-28  444  =

0fbb79b7fd2c915 Sven Peter    2021-09-28  445  static bool tps6598x_read_po=
wer_status(struct tps6598x *tps)
0fbb79b7fd2c915 Sven Peter    2021-09-28  446  {
0fbb79b7fd2c915 Sven Peter    2021-09-28  447  	u16 pwr_status;
0fbb79b7fd2c915 Sven Peter    2021-09-28  448  	int ret;
0fbb79b7fd2c915 Sven Peter    2021-09-28  449  =

0fbb79b7fd2c915 Sven Peter    2021-09-28  450  	ret =3D tps6598x_read16(tps=
, TPS_REG_POWER_STATUS, &pwr_status);
0fbb79b7fd2c915 Sven Peter    2021-09-28  451  	if (ret < 0) {
0fbb79b7fd2c915 Sven Peter    2021-09-28  452  		dev_err(tps->dev, "failed =
to read power status: %d\n", ret);
0fbb79b7fd2c915 Sven Peter    2021-09-28  453  		return false;
0fbb79b7fd2c915 Sven Peter    2021-09-28  454  	}
92440202a88009e Guido G=C3=BCnther 2022-03-17 @455  	tps->pwr_status =3D pw=
r_status;
0fbb79b7fd2c915 Sven Peter    2021-09-28  456  	trace_tps6598x_power_status=
(pwr_status);
0fbb79b7fd2c915 Sven Peter    2021-09-28  457  =

0fbb79b7fd2c915 Sven Peter    2021-09-28  458  	return true;
0fbb79b7fd2c915 Sven Peter    2021-09-28  459  }
0fbb79b7fd2c915 Sven Peter    2021-09-28  460  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0571145624178576004==--

