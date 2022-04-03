Content-Type: multipart/mixed; boundary="===============8720275616688061354=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hid/hid-core.c:1767:2: warning: There is an unknown macro here somewhere. Configuration is required. If list_for_each_entry is a macro then please configure it. [unknownMacro]
Date: Mon, 04 Apr 2022 02:43:45 +0800
Message-ID: <202204040234.uKjQjQEt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8720275616688061354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC: Jiri Kosina <jkosina@suse.cz>
CC: Ping Cheng <ping.cheng@wacom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: 22f4b026c3ddd4b26c5baa202bd3ee38feaa2e9a HID: compute an ordered li=
st of input fields to process
date:   5 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 5 weeks ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/hid/hid-quirks.c:1145:39: warning: Uninitialized variable: q->hi=
d_bl_item [uninitvar]
     if (bus =3D=3D HID_BUS_ANY || bus =3D=3D q->hid_bl_item.bus) {
                                         ^
--
>> drivers/hid/hid-input.c:1496:2: warning: There is an unknown macro here =
somewhere. Configuration is required. If list_for_each_entry is a macro the=
n please configure it. [unknownMacro]
    list_for_each_entry(hidinput, &hid->inputs, list)
    ^
--
>> drivers/hid/hid-core.c:1767:2: warning: There is an unknown macro here s=
omewhere. Configuration is required. If list_for_each_entry is a macro then=
 please configure it. [unknownMacro]
    list_for_each_entry(report, &report_enum->report_list, list)
    ^

vim +1767 drivers/hid/hid-core.c

22f4b026c3ddd4 Benjamin Tissoires 2022-02-03  1761  =

22f4b026c3ddd4 Benjamin Tissoires 2022-02-03  1762  static void hid_process=
_ordering(struct hid_device *hid)
22f4b026c3ddd4 Benjamin Tissoires 2022-02-03  1763  {
22f4b026c3ddd4 Benjamin Tissoires 2022-02-03  1764  	struct hid_report *rep=
ort;
22f4b026c3ddd4 Benjamin Tissoires 2022-02-03  1765  	struct hid_report_enum=
 *report_enum =3D &hid->report_enum[HID_INPUT_REPORT];
22f4b026c3ddd4 Benjamin Tissoires 2022-02-03  1766  =

22f4b026c3ddd4 Benjamin Tissoires 2022-02-03 @1767  	list_for_each_entry(re=
port, &report_enum->report_list, list)
22f4b026c3ddd4 Benjamin Tissoires 2022-02-03  1768  		hid_report_process_or=
dering(hid, report);
22f4b026c3ddd4 Benjamin Tissoires 2022-02-03  1769  }
22f4b026c3ddd4 Benjamin Tissoires 2022-02-03  1770  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8720275616688061354==--

