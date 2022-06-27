Content-Type: multipart/mixed; boundary="===============1254148227831355009=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4010/5792] drivers/acpi/scan.c:615:35: warning: Uninitialized variable: acpi_device_bus_id->bus_id [uninitvar]
Date: Tue, 28 Jun 2022 01:25:49 +0800
Message-ID: <202206280117.WjAtAcb5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1254148227831355009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/a=
cpi/scan.c:615:35: warning: Uninitialized variable: acpi_device_bus_id->bus=
_id [uninitvar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   aab35c3d5112df6e329a1a5a5a1881e5c4ca3821
commit: a976a2ac7708c63257d42707c8423047136797a0 [4010/5792] ACPI: scan: Wa=
lk ACPI device's children using driver core
:::::: branch date: 11 hours ago
:::::: commit date: 6 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a976a2ac7708c63257d42707c8423047136797a0
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/acpi/scan.c:615:35: warning: Uninitialized variable: acpi_device=
_bus_id->bus_id [uninitvar]
     if (!strcmp(acpi_device_bus_id->bus_id, dev_id))
                                     ^

vim +615 drivers/acpi/scan.c

78ea4639a7647f Rafael J. Wysocki 2014-02-04  608  =

c1013ff7a5472d Rafael J. Wysocki 2021-01-14  609  static struct acpi_device=
_bus_id *acpi_device_bus_id_match(const char *dev_id)
c1013ff7a5472d Rafael J. Wysocki 2021-01-14  610  {
c1013ff7a5472d Rafael J. Wysocki 2021-01-14  611  	struct acpi_device_bus_i=
d *acpi_device_bus_id;
c1013ff7a5472d Rafael J. Wysocki 2021-01-14  612  =

c1013ff7a5472d Rafael J. Wysocki 2021-01-14  613  	/* Find suitable bus_id =
and instance number in acpi_bus_id_list. */
c1013ff7a5472d Rafael J. Wysocki 2021-01-14  614  	list_for_each_entry(acpi=
_device_bus_id, &acpi_bus_id_list, node) {
c1013ff7a5472d Rafael J. Wysocki 2021-01-14 @615  		if (!strcmp(acpi_device=
_bus_id->bus_id, dev_id))
c1013ff7a5472d Rafael J. Wysocki 2021-01-14  616  			return acpi_device_bus=
_id;
c1013ff7a5472d Rafael J. Wysocki 2021-01-14  617  	}
c1013ff7a5472d Rafael J. Wysocki 2021-01-14  618  	return NULL;
c1013ff7a5472d Rafael J. Wysocki 2021-01-14  619  }
c1013ff7a5472d Rafael J. Wysocki 2021-01-14  620  =


:::::: The code at line 615 was first introduced by commit
:::::: c1013ff7a5472db637c56bb6237f8343398c03a7 ACPI: scan: Rearrange memor=
y allocation in acpi_device_add()

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1254148227831355009==--

