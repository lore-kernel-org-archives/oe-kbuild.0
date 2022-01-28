Content-Type: multipart/mixed; boundary="===============1058520159992852233=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 08/12] HID: core: for input reports, process the usages by priority list
Date: Fri, 28 Jan 2022 21:52:41 +0800
Message-ID: <202201282135.fedFj5tc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1058520159992852233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220126161832.3193805-9-benjamin.tissoires@redhat.com>
References: <20220126161832.3193805-9-benjamin.tissoires@redhat.com>
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
TO: Jiri Kosina <jikos@kernel.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: "Ahelenia Ziemia=C5=84ska" <nabijaczleweli@nabijaczleweli.xyz>
TO: Ping Cheng <pinglinux@gmail.com>
TO: Aaron Armstrong Skomra <skomra@gmail.com>
TO: Jason Gerecke <killertofu@gmail.com>
TO: Peter Hutterer <peter.hutterer@who-t.net>
CC: linux-input(a)vger.kernel.org
CC: linux-doc(a)vger.kernel.org

Hi Benjamin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on hid/for-next]
[also build test WARNING on v5.17-rc1 next-20220127]
[cannot apply to jikos-hid/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Benjamin-Tissoires/HID-fix=
-for-generic-input-processing/20220127-002107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220124 (https://download.01.org/0day-ci/arc=
hive/20220128/202201282135.fedFj5tc-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7a=
a016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/5f297c23cba491924689834a0=
1ef511263c9e547
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Benjamin-Tissoires/HID-fix-for-gen=
eric-input-processing/20220127-002107
        git checkout 5f297c23cba491924689834a01ef511263c9e547
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:2353:2: note: Taking false branch
           if (hdev->ll_driver->request)
           ^
   drivers/hid/hid-core.c:2356:2: note: Calling '__hid_request'
           __hid_request(hdev, report, reqtype);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1931:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/hid/hid-core.c:1931:2: note: Taking false branch
           if (!buf)
           ^
   drivers/hid/hid-core.c:1936:6: note: Assuming 'reqtype' is equal to HID_=
REQ_SET_REPORT
           if (reqtype =3D=3D HID_REQ_SET_REPORT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1936:2: note: Taking true branch
           if (reqtype =3D=3D HID_REQ_SET_REPORT)
           ^
   drivers/hid/hid-core.c:1937:3: note: Calling 'hid_output_report'
                   hid_output_report(report, buf);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1844:14: note: Field 'id' is <=3D 0
           if (report->id > 0)
                       ^
   drivers/hid/hid-core.c:1844:2: note: Taking false branch
           if (report->id > 0)
           ^
   drivers/hid/hid-core.c:1848:14: note: Assuming 'n' is < field 'maxfield'
           for (n =3D 0; n < report->maxfield; n++)
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1848:2: note: Loop condition is true.  Entering l=
oop body
           for (n =3D 0; n < report->maxfield; n++)
           ^
   drivers/hid/hid-core.c:1849:3: note: Calling 'hid_output_field'
                   hid_output_field(report->device, report->field[n], data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1811:2: note: 'size' initialized here
           unsigned size =3D field->report_size;
           ^~~~~~~~~~~~~
   drivers/hid/hid-core.c:1814:14: note: Assuming 'n' is < 'count'
           for (n =3D 0; n < count; n++) {
                       ^~~~~~~~~
   drivers/hid/hid-core.c:1814:2: note: Loop condition is true.  Entering l=
oop body
           for (n =3D 0; n < count; n++) {
           ^
   drivers/hid/hid-core.c:1815:7: note: Assuming field 'logical_minimum' is=
 < 0
                   if (field->logical_minimum < 0) /* signed values */
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1815:3: note: Taking true branch
                   if (field->logical_minimum < 0) /* signed values */
                   ^
   drivers/hid/hid-core.c:1816:4: note: Calling 'implement'
                           implement(hid, data, offset + n * size, size,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1426:15: note: Assuming 'n' is <=3D 32
           if (unlikely(n > 32)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/hid/hid-core.c:1426:2: note: Taking false branch
           if (unlikely(n > 32)) {
           ^
   drivers/hid/hid-core.c:1430:13: note: Assuming 'n' is >=3D 32
           } else if (n < 32) {
                      ^~~~~~
   drivers/hid/hid-core.c:1430:9: note: Taking false branch
           } else if (n < 32) {
                  ^
   drivers/hid/hid-core.c:1816:4: note: Returning from 'implement'
                           implement(hid, data, offset + n * size, size,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1814:14: note: Assuming 'n' is < 'count'
           for (n =3D 0; n < count; n++) {
                       ^~~~~~~~~
   drivers/hid/hid-core.c:1814:2: note: Loop condition is true.  Entering l=
oop body
           for (n =3D 0; n < count; n++) {
           ^
   drivers/hid/hid-core.c:1815:14: note: Field 'logical_minimum' is < 0
                   if (field->logical_minimum < 0) /* signed values */
                              ^
   drivers/hid/hid-core.c:1815:3: note: Taking true branch
                   if (field->logical_minimum < 0) /* signed values */
                   ^
   drivers/hid/hid-core.c:1817:31: note: Passing the value 32 via 2nd param=
eter 'n'
                                     s32ton(field->value[n], size));
                                                             ^~~~
   drivers/hid/hid-core.c:1817:7: note: Calling 's32ton'
                                     s32ton(field->value[n], size));
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1339:6: note: Assuming 'a' is 0
           if (a && a !=3D -1)
               ^
   drivers/hid/hid-core.c:1339:8: note: Left side of '&&' is false
           if (a && a !=3D -1)
                 ^
   drivers/hid/hid-core.c:1341:21: note: The result of the left shift is un=
defined due to shifting by '32', which is greater or equal to the width of =
type 'int'
           return value & ((1 << n) - 1);
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
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/iio/humidity/hts221_core.c:183:13: warning: The result of the le=
ft shift is undefined due to shifting '2' by '31', which is unrepresentable=
 in the unsigned version of the return type 'int' [clang-analyzer-core.Unde=
finedBinaryOperatorResult]
           data =3D ((i << __ffs(avg->mask)) & avg->mask);
                      ^
   drivers/iio/humidity/hts221_core.c:486:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/humidity/hts221_core.c:486:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/humidity/hts221_core.c:489:2: note: Control jumps to 'case I=
IO_CHAN_INFO_OVERSAMPLING_RATIO:'  at line 493
           switch (mask) {
           ^
   drivers/iio/humidity/hts221_core.c:494:3: note: Control jumps to 'case I=
IO_TEMP:'  at line 498
                   switch (chan->type) {
                   ^
   drivers/iio/humidity/hts221_core.c:499:10: note: Calling 'hts221_update_=
avg'
                           ret =3D hts221_update_avg(hw, HTS221_SENSOR_T, v=
al);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:176:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < HTS221_AVG_DEPTH; i++)
           ^
   drivers/iio/humidity/hts221_core.c:177:7: note: Assuming the condition i=
s false
                   if (avg->avg_avl[i] =3D=3D val)

vim +1665 drivers/hid/hid-core.c

dde5845a529ff7 Jiri Kosina        2006-12-08  1648  =

d95c6e8572e0df Benjamin Tissoires 2022-01-26  1649  /*
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1650   * Analyse a received r=
eport, and fetch the data from it. The field
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1651   * content is stored fo=
r next report processing (we do differential
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1652   * reporting to the lay=
er).
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1653   */
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1654  static void hid_process=
_report(struct hid_device *hid,
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1655  			       struct hid_re=
port *report,
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1656  			       __u8 *data,
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1657  			       int interrupt)
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1658  {
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1659  	unsigned int a;
5f297c23cba491 Benjamin Tissoires 2022-01-26  1660  	struct hid_field_entry=
 *entry;
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1661  	struct hid_field *fiel=
d;
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1662  =

5f297c23cba491 Benjamin Tissoires 2022-01-26  1663  	/* first retrieve all =
incoming values in data */
5f297c23cba491 Benjamin Tissoires 2022-01-26  1664  	for (a =3D 0; a < repo=
rt->maxfield; a++)
5f297c23cba491 Benjamin Tissoires 2022-01-26 @1665  		hid_input_fetch_field=
(hid, field =3D report->field[a], data);
5f297c23cba491 Benjamin Tissoires 2022-01-26  1666  =

5f297c23cba491 Benjamin Tissoires 2022-01-26  1667  	if (!list_empty(&repor=
t->field_entry_list)) {
5f297c23cba491 Benjamin Tissoires 2022-01-26  1668  		/* INPUT_REPORT, we h=
ave a priority list of fields */
5f297c23cba491 Benjamin Tissoires 2022-01-26  1669  		list_for_each_entry(e=
ntry,
5f297c23cba491 Benjamin Tissoires 2022-01-26  1670  				    &report->field_=
entry_list,
5f297c23cba491 Benjamin Tissoires 2022-01-26  1671  				    list) {
5f297c23cba491 Benjamin Tissoires 2022-01-26  1672  			field =3D entry->fie=
ld;
5f297c23cba491 Benjamin Tissoires 2022-01-26  1673  =

5f297c23cba491 Benjamin Tissoires 2022-01-26  1674  			if (field->flags & H=
ID_MAIN_ITEM_VARIABLE)
5f297c23cba491 Benjamin Tissoires 2022-01-26  1675  				hid_process_event(h=
id,
5f297c23cba491 Benjamin Tissoires 2022-01-26  1676  						  field,
5f297c23cba491 Benjamin Tissoires 2022-01-26  1677  						  &field->usage[e=
ntry->index],
5f297c23cba491 Benjamin Tissoires 2022-01-26  1678  						  field->new_valu=
e[entry->index],
5f297c23cba491 Benjamin Tissoires 2022-01-26  1679  						  interrupt);
5f297c23cba491 Benjamin Tissoires 2022-01-26  1680  			else
5f297c23cba491 Benjamin Tissoires 2022-01-26  1681  				hid_input_array_fie=
ld(hid, field, interrupt);
5f297c23cba491 Benjamin Tissoires 2022-01-26  1682  		}
5f297c23cba491 Benjamin Tissoires 2022-01-26  1683  =

5f297c23cba491 Benjamin Tissoires 2022-01-26  1684  		/* we need to do the =
memcpy at the end for var items */
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1685  		for (a =3D 0; a < rep=
ort->maxfield; a++) {
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1686  			field =3D report->fi=
eld[a];
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1687  =

5f297c23cba491 Benjamin Tissoires 2022-01-26  1688  			if (field->flags & H=
ID_MAIN_ITEM_VARIABLE)
5f297c23cba491 Benjamin Tissoires 2022-01-26  1689  				memcpy(field->value=
, field->new_value,
5f297c23cba491 Benjamin Tissoires 2022-01-26  1690  				       field->repor=
t_count * sizeof(__s32));
5f297c23cba491 Benjamin Tissoires 2022-01-26  1691  		}
5f297c23cba491 Benjamin Tissoires 2022-01-26  1692  	} else {
5f297c23cba491 Benjamin Tissoires 2022-01-26  1693  		/* FEATURE_REPORT, re=
gular processing */
5f297c23cba491 Benjamin Tissoires 2022-01-26  1694  		for (a =3D 0; a < rep=
ort->maxfield; a++) {
5f297c23cba491 Benjamin Tissoires 2022-01-26  1695  			field =3D report->fi=
eld[a];
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1696  =

d95c6e8572e0df Benjamin Tissoires 2022-01-26  1697  			if (field->flags & H=
ID_MAIN_ITEM_VARIABLE)
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1698  				hid_input_var_field=
(hid, field, interrupt);
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1699  			else
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1700  				hid_input_array_fie=
ld(hid, field, interrupt);
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1701  		}
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1702  	}
5f297c23cba491 Benjamin Tissoires 2022-01-26  1703  }
d95c6e8572e0df Benjamin Tissoires 2022-01-26  1704  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1058520159992852233==--

