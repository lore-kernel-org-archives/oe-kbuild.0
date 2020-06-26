Content-Type: multipart/mixed; boundary="===============6450830353504522950=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pm:acpica-osl 3/4] drivers/acpi/acpica/exregion.c:26:27: warning: struct member 'acpi_mm_context::first_mm' is never used.
Date: Fri, 26 Jun 2020 11:10:38 +0800
Message-ID: <202006261130.Mt4FwERW%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6450830353504522950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-acpi(a)vger.kernel.org
CC: devel(a)acpica.org
CC: linux-pm(a)vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 acpica-osl
head:   6ceaf6e75ff7d58c6e4297a7af0c478936192b16
commit: e764ae7e1b97736b3ded4bdf7fe13dd61492f155 [3/4] ACPICA: Preserve mem=
ory opregion mappings if supported by OS
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/acpi/acpica/exregion.c:26:27: warning: struct member 'acpi_mm_co=
ntext::first_mm' is never used. [unusedStructMember]
    struct acpi_mem_mapping *first_mm;
                             ^

# https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commi=
t/?id=3De764ae7e1b97736b3ded4bdf7fe13dd61492f155
git remote add pm https://git.kernel.org/pub/scm/linux/kernel/git/rafael/li=
nux-pm.git
git remote update pm
git checkout e764ae7e1b97736b3ded4bdf7fe13dd61492f155
vim +26 drivers/acpi/acpica/exregion.c

e764ae7e1b9773 Rafael J. Wysocki 2020-06-22  23  =

e764ae7e1b9773 Rafael J. Wysocki 2020-06-22  24  struct acpi_mm_context {
e764ae7e1b9773 Rafael J. Wysocki 2020-06-22  25  	struct acpi_mem_space_con=
text mem_info;
e764ae7e1b9773 Rafael J. Wysocki 2020-06-22 @26  	struct acpi_mem_mapping *=
first_mm;
e764ae7e1b9773 Rafael J. Wysocki 2020-06-22  27  };
e764ae7e1b9773 Rafael J. Wysocki 2020-06-22  28  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6450830353504522950==--

