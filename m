Content-Type: multipart/mixed; boundary="===============2000964035421690424=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2] ACPI: Drop rcu usage for MMIO mappings
Date: Tue, 12 May 2020 01:51:33 +0800
Message-ID: <202005120116.equMXMsi%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2000964035421690424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <158889473309.2292982.18007035454673387731.stgit@dwillia2-de=
sk3.amr.corp.intel.com>
References: <158889473309.2292982.18007035454673387731.stgit@dwillia2-des=
k3.amr.corp.intel.com>
TO: Dan Williams <dan.j.williams@intel.com>
TO: rafael.j.wysocki(a)intel.com
TO: stable(a)vger.kernel.org
TO: Len Brown <lenb@kernel.org>
TO: Borislav Petkov <bp@alien8.de>
TO: Ira Weiny <ira.weiny@intel.com>
TO: James Morse <james.morse@arm.com>
TO: Erik Kaneda <erik.kaneda@intel.com>
TO: Myron Stowe <myron.stowe@redhat.com>
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: linux-kernel(a)vger.kernel.org
TO: linux-acpi(a)vger.kernel.org
TO: linux-nvdimm(a)lists.01.org
TO: stable(a)vger.kernel.org
TO: Len Brown <lenb@kernel.org>
TO: Borislav Petkov <bp@alien8.de>
TO: Ira Weiny <ira.weiny@intel.com>
TO: James Morse <james.morse@arm.com>
TO: Erik Kaneda <erik.kaneda@intel.com>
TO: Myron Stowe <myron.stowe@redhat.com>
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: linux-kernel(a)vger.kernel.org
TO: linux-acpi(a)vger.kernel.org
TO: linux-nvdimm(a)lists.01.org
CC: stable(a)vger.kernel.org
CC: Len Brown <lenb@kernel.org>
CC: Borislav Petkov <bp@alien8.de>
CC: Ira Weiny <ira.weiny@intel.com>
CC: James Morse <james.morse@arm.com>
CC: Erik Kaneda <erik.kaneda@intel.com>
CC: Myron Stowe <myron.stowe@redhat.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Dan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pm/linux-next]
[also build test WARNING on v5.7-rc5 next-20200511]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Dan-Williams/ACPI-Drop-rcu=
-usage-for-MMIO-mappings/20200509-013208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 linux-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/acpi/osl.c:707 acpi_os_rw_map() warn: inconsistent returns 'acpi_io=
remap_lock'.

Old smatch warnings:
drivers/acpi/osl.c:326 acpi_os_map_iomem() warn: impossible condition '(phy=
s > (~0)) =3D> (0-u64max > u64max)'

# https://github.com/0day-ci/linux/commit/5a91d41f89e8874053e12766fa8eb5eaa=
997d277
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5a91d41f89e8874053e12766fa8eb5eaa997d277
vim +/acpi_ioremap_lock +707 drivers/acpi/osl.c

eeb2d80d502af2 Srinivas Pandruvada 2017-10-05  687  =

5a91d41f89e887 Dan Williams        2020-05-07  688  static void __iomem *ac=
pi_os_rw_map(acpi_physical_address phys_addr,
5a91d41f89e887 Dan Williams        2020-05-07  689  				    unsigned int si=
ze, bool *did_fallback)
5a91d41f89e887 Dan Williams        2020-05-07  690  {
5a91d41f89e887 Dan Williams        2020-05-07  691  	void __iomem *virt_add=
r;
5a91d41f89e887 Dan Williams        2020-05-07  692  =

5a91d41f89e887 Dan Williams        2020-05-07  693  	if (WARN_ONCE(in_inter=
rupt(), "ioremap in interrupt context\n"))
5a91d41f89e887 Dan Williams        2020-05-07  694  		return NULL;
5a91d41f89e887 Dan Williams        2020-05-07  695  =

5a91d41f89e887 Dan Williams        2020-05-07  696  	/* Try to use a cached=
 mapping and fallback otherwise */
5a91d41f89e887 Dan Williams        2020-05-07  697  	*did_fallback =3D fals=
e;
5a91d41f89e887 Dan Williams        2020-05-07  698  	mutex_lock(&acpi_iorem=
ap_lock);
5a91d41f89e887 Dan Williams        2020-05-07  699  	virt_addr =3D acpi_map=
_vaddr_lookup(phys_addr, size);
5a91d41f89e887 Dan Williams        2020-05-07  700  	if (virt_addr)
5a91d41f89e887 Dan Williams        2020-05-07  701  		return virt_addr;
5a91d41f89e887 Dan Williams        2020-05-07  702  	mutex_unlock(&acpi_ior=
emap_lock);
5a91d41f89e887 Dan Williams        2020-05-07  703  =

5a91d41f89e887 Dan Williams        2020-05-07  704  	virt_addr =3D acpi_os_=
ioremap(phys_addr, size);
5a91d41f89e887 Dan Williams        2020-05-07  705  	*did_fallback =3D true;
5a91d41f89e887 Dan Williams        2020-05-07  706  =

5a91d41f89e887 Dan Williams        2020-05-07 @707  	return virt_addr;
5a91d41f89e887 Dan Williams        2020-05-07  708  }
5a91d41f89e887 Dan Williams        2020-05-07  709  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2000964035421690424==--

