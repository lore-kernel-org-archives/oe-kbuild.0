Content-Type: multipart/mixed; boundary="===============4045993341285425722=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9076/11353] drivers/hid/hid-core.c:1665:30: warning: Although the value stored to 'field' is used in the enclosing expression, the value is never actually read from 'field' [clang-analyzer-deadcode.DeadStores]
Date: Wed, 09 Mar 2022 16:13:08 +0800
Message-ID: <202203091613.J6S7TE1f-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4045993341285425722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC: Jiri Kosina <jkosina@suse.cz>
CC: Ping Cheng <ping.cheng@wacom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   cb153b68ff91cbc434f3de70ac549e110543e1bb
commit: bebcc522fbee4bf51a2571378154ef2a4bf14724 [9076/11353] HID: core: fo=
r input reports, process the usages by priority list
:::::: branch date: 24 hours ago
:::::: commit date: 8 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
309/202203091613.J6S7TE1f-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dbebcc522fbee4bf51a2571378154ef2a4bf14724
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout bebcc522fbee4bf51a2571378154ef2a4bf14724
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                      ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/hid/hid-core.c:1430:9: note: '?' condition is false
           } else if (n < 32) {
                  ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/hid/hid-core.c:1430:13: note: 'n' is >=3D 32
           } else if (n < 32) {
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
   drivers/hid/hid-core.c:1430:9: note: '?' condition is false
           } else if (n < 32) {
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
   drivers/hid/hid-core.c:1430:9: note: Taking false branch
           } else if (n < 32) {
                  ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/hid/hid-core.c:1442:30: note: Passing the value 32 via 3rd param=
eter 'n'
           __implement(report, offset, n, value);
                                       ^
   drivers/hid/hid-core.c:1442:2: note: Calling '__implement'
           __implement(report, offset, n, value);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1405:9: note: Assuming the condition is false
           while (n - bits_to_set >=3D 0) {
                  ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1405:2: note: Loop condition is false. Execution =
continues on line 1416
           while (n - bits_to_set >=3D 0) {
           ^
   drivers/hid/hid-core.c:1416:2: note: '?' condition is false
           if (n) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/hid/hid-core.c:1416:6: note: 'n' is 32
           if (n) {
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
   drivers/hid/hid-core.c:1416:2: note: '?' condition is true
           if (n) {
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
   drivers/hid/hid-core.c:1416:2: note: Taking true branch
           if (n) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/hid/hid-core.c:1417:22: note: The result of the left shift is un=
defined due to shifting by '32', which is greater or equal to the width of =
type 'unsigned int'
                   u8 bit_mask =3D ((1U << n) - 1);
                                      ^  ~
>> drivers/hid/hid-core.c:1665:30: warning: Although the value stored to 'f=
ield' is used in the enclosing expression, the value is never actually read=
 from 'field' [clang-analyzer-deadcode.DeadStores]
                   hid_input_fetch_field(hid, field =3D report->field[a], d=
ata);
                                              ^       ~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1665:30: note: Although the value stored to 'fiel=
d' is used in the enclosing expression, the value is never actually read fr=
om 'field'
                   hid_input_fetch_field(hid, field =3D report->field[a], d=
ata);
                                              ^       ~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:2198:3: warning: Value stored to 'len' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   len +=3D sprintf(buf + len, "%shidraw%d", len ? "," : "",
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:2198:3: note: Value stored to 'len' is never read
                   len +=3D sprintf(buf + len, "%shidraw%d", len ? "," : "",
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/net/phy/micrel.c:1109:2: warning: Value stored to 'regval' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:1109:2: note: Value stored to 'regval' is never=
 read
           regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   include/linux/jhash.h:95:25: warning: The left operand of '<<' is a garb=
age value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           case 6:  b +=3D (u32)k[5]<<8;     fallthrough;
                                  ^
   net/batman-adv/bridge_loop_avoidance.c:2475:6: note: Assuming the condit=
ion is false
           if (!atomic_read(&bat_priv->bridge_loop_avoidance))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/batman-adv/bridge_loop_avoidance.c:2475:2: note: '?' condition is fa=
lse
           if (!atomic_read(&bat_priv->bridge_loop_avoidance))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/batman-adv/bridge_loop_avoidance.c:2475:2: note: '?' condition is fa=
lse
           if (!atomic_read(&bat_priv->bridge_loop_avoidance))
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
   net/batman-adv/bridge_loop_avoidance.c:2475:2: note: Taking false branch
           if (!atomic_read(&bat_priv->bridge_loop_avoidance))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/batman-adv/bridge_loop_avoidance.c:2479:7: note: 'primary_if' is non=
-null
           if (!primary_if)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/batman-adv/bridge_loop_avoidance.c:2479:2: note: '?' condition is fa=
lse
           if (!primary_if)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/batman-adv/bridge_loop_avoidance.c:2479:7: note: 'primary_if' is non=
-null
           if (!primary_if)
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
   net/batman-adv/bridge_loop_avoidance.c:2479:2: note: '?' condition is fa=
lse
           if (!primary_if)
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

vim +1665 drivers/hid/hid-core.c

dde5845a529ff75 Jiri Kosina        2006-12-08  1648  =

b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1649  /*
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1650   * Analyse a received =
report, and fetch the data from it. The field
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1651   * content is stored f=
or next report processing (we do differential
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1652   * reporting to the la=
yer).
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1653   */
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1654  static void hid_proces=
s_report(struct hid_device *hid,
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1655  			       struct hid_r=
eport *report,
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1656  			       __u8 *data,
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1657  			       int interrup=
t)
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1658  {
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1659  	unsigned int a;
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1660  	struct hid_field_entr=
y *entry;
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1661  	struct hid_field *fie=
ld;
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1662  =

bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1663  	/* first retrieve all=
 incoming values in data */
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1664  	for (a =3D 0; a < rep=
ort->maxfield; a++)
bebcc522fbee4bf Benjamin Tissoires 2022-02-03 @1665  		hid_input_fetch_fiel=
d(hid, field =3D report->field[a], data);
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1666  =

bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1667  	if (!list_empty(&repo=
rt->field_entry_list)) {
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1668  		/* INPUT_REPORT, we =
have a priority list of fields */
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1669  		list_for_each_entry(=
entry,
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1670  				    &report->field=
_entry_list,
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1671  				    list) {
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1672  			field =3D entry->fi=
eld;
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1673  =

bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1674  			if (field->flags & =
HID_MAIN_ITEM_VARIABLE)
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1675  				hid_process_event(=
hid,
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1676  						  field,
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1677  						  &field->usage[=
entry->index],
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1678  						  field->new_val=
ue[entry->index],
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1679  						  interrupt);
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1680  			else
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1681  				hid_input_array_fi=
eld(hid, field, interrupt);
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1682  		}
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1683  =

bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1684  		/* we need to do the=
 memcpy at the end for var items */
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1685  		for (a =3D 0; a < re=
port->maxfield; a++) {
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1686  			field =3D report->f=
ield[a];
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1687  =

bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1688  			if (field->flags & =
HID_MAIN_ITEM_VARIABLE)
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1689  				memcpy(field->valu=
e, field->new_value,
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1690  				       field->repo=
rt_count * sizeof(__s32));
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1691  		}
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1692  	} else {
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1693  		/* FEATURE_REPORT, r=
egular processing */
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1694  		for (a =3D 0; a < re=
port->maxfield; a++) {
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1695  			field =3D report->f=
ield[a];
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1696  =

b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1697  			if (field->flags & =
HID_MAIN_ITEM_VARIABLE)
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1698  				hid_input_var_fiel=
d(hid, field, interrupt);
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1699  			else
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1700  				hid_input_array_fi=
eld(hid, field, interrupt);
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1701  		}
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1702  	}
bebcc522fbee4bf Benjamin Tissoires 2022-02-03  1703  }
b79c1abae5e1972 Benjamin Tissoires 2022-02-03  1704  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4045993341285425722==--

