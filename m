Content-Type: multipart/mixed; boundary="===============8597114514878941079=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/intel/pmc/core.c:1291:18: warning: Array index 'i' is used before limits check. [arrayIndexThenCheck]
Date: Wed, 03 Aug 2022 07:22:28 +0800
Message-ID: <202208030709.cRW50ibV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8597114514878941079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/p=
latform/x86/intel/pmc/core.c:1291:18: warning: Array index 'i' is used befo=
re limits check. [arrayIndexThenCheck]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kate Hsuan <hpa@redhat.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   569bede0cff5e98c0f862d486406b79dcada8eea
commit: fa082a7cf5a66a42a06da048afd972e2cc1b67ea platform/x86: intel_pmc_co=
re: Move to intel sub-directory
date:   12 months ago
:::::: branch date: 53 minutes ago
:::::: commit date: 12 months ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout fa082a7cf5a66a42a06da048afd972e2cc1b67ea
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> drivers/platform/x86/intel/pmc/core.c:1519:7: warning: Local variable 'm=
ode' shadows outer variable [shadowVariable]
     int mode =3D pri_order[p];
         ^
   drivers/platform/x86/intel/pmc/core.c:1489:6: note: Shadowed declaration
    int mode, i, p;
        ^
   drivers/platform/x86/intel/pmc/core.c:1519:7: note: Shadow variable
     int mode =3D pri_order[p];
         ^
>> drivers/usb/core/hub.c:4885:8: warning: Local variable 'delay' shadows o=
uter variable [shadowVariable]
      u32 delay;
          ^
   drivers/usb/core/hub.c:4634:12: note: Shadowed declaration
    unsigned  delay =3D HUB_SHORT_RESET_TIME;
              ^
   drivers/usb/core/hub.c:4885:8: note: Shadow variable
      u32 delay;
          ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/platform/x86/intel/pmc/core.c:1291:18: warning: Array index 'i' =
is used before limits check. [arrayIndexThenCheck]
     for (i =3D 0; map[i].name && i < len; i++) {
                    ^
>> drivers/platform/x86/intel/pmc/core.c:921:59: warning: Parameter 'addr_x=
ram' can be declared with const [constParameter]
   static int pmc_core_send_msg(struct pmc_dev *pmcdev, u32 *addr_xram)
                                                             ^
--
>> drivers/usb/core/otg_productlist.h:58:10: warning: Redundant initializat=
ion for 'id'. The initialized value is overwritten before it is read. [redu=
ndantInitialization]
    for (id =3D productlist_table; id->match_flags; id++) {
            ^
   drivers/usb/core/otg_productlist.h:43:27: note: id is initialized
    struct usb_device_id *id =3D productlist_table;
                             ^
   drivers/usb/core/otg_productlist.h:58:10: note: id is overwritten
    for (id =3D productlist_table; id->match_flags; id++) {
            ^
>> drivers/usb/core/hub.c:1981:79: warning: Parameter 'owner' can be declar=
ed with const [constParameter]
   void usb_hub_release_all_ports(struct usb_device *hdev, struct usb_dev_s=
tate *owner)
                                                                           =
      ^
   drivers/usb/core/hub.c:1966:27: warning: Parameter 'owner' can be declar=
ed with const [constParameter]
       struct usb_dev_state *owner)
                             ^

vim +/i +1291 drivers/platform/x86/intel/pmc/core.c

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1258  =

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1259  static int pmc_core_substate_req_regs_show(struct seq_file *s, =
void *unused)
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1260  {
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1261  	struct pmc_dev *pmcdev =3D s->private;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1262  	const struct pmc_bit_map **maps =3D pmcdev->map->lpm_sts;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1263  	const struct pmc_bit_map *map;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1264  	const int num_maps =3D pmcdev->map->lpm_num_maps;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1265  	u32 sts_offset =3D pmcdev->map->lpm_status_offset;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1266  	u32 *lpm_req_regs =3D pmcdev->lpm_req_regs;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1267  	int mp;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1268  =

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1269  	/* Display the header */
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1270  	pmc_core_substate_req_header_show(s);
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1271  =

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1272  	/* Loop over maps */
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1273  	for (mp =3D 0; mp < num_maps; mp++) {
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1274  		u32 req_mask =3D 0;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1275  		u32 lpm_status;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1276  		int mode, idx, i, len =3D 32;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1277  =

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1278  		/*
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1279  		 * Capture the requirements and create a mask so that we only
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1280  		 * show an element if it's required for at least one of the
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1281  		 * enabled low power modes
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1282  		 */
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1283  		pmc_for_each_mode(idx, mode, pmcdev)
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1284  			req_mask |=3D lpm_req_regs[mp + (mode * num_maps)];
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1285  =

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1286  		/* Get the last latched status for this map */
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1287  		lpm_status =3D pmc_core_reg_read(pmcdev, sts_offset + (mp * 4=
));
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1288  =

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1289  		/*  Loop over elements in this map */
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1290  		map =3D maps[mp];
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16 @1291  		for (i =3D 0; map[i].name && i < len; i++) {
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1292  			u32 bit_mask =3D map[i].bit_mask;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1293  =

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1294  			if (!(bit_mask & req_mask))
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1295  				/*
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1296  				 * Not required for any enabled states
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1297  				 * so don't display
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1298  				 */
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1299  				continue;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1300  =

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1301  			/* Display the element name in the first column */
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1302  			seq_printf(s, "%30s |", map[i].name);
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1303  =

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1304  			/* Loop over the enabled states and display if required */
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1305  			pmc_for_each_mode(idx, mode, pmcdev) {
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1306  				if (lpm_req_regs[mp + (mode * num_maps)] & bit_mask)
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1307  					seq_printf(s, " %9s |",
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1308  						   "Required");
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1309  				else
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1310  					seq_printf(s, " %9s |", " ");
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1311  			}
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1312  =

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1313  			/* In Status column, show the last captured state of this ag=
ent */
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1314  			if (lpm_status & bit_mask)
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1315  				seq_printf(s, " %9s |", "Yes");
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1316  			else
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1317  				seq_printf(s, " %9s |", " ");
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1318  =

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1319  			seq_puts(s, "\n");
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1320  		}
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1321  	}
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1322  =

952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1323  	return 0;
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1324  }
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1325  DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_req_regs);
952c15538e5346 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela 2021-0=
4-16  1326  =


:::::: The code@line 1291 was first introduced by commit
:::::: 952c15538e5346fcb0548370f25380b7bc62ed40 platform/x86: intel_pmc_cor=
e: Add requirements file to debugfs

:::::: TO: Gayatri Kammela <gayatri.kammela@intel.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8597114514878941079==--

