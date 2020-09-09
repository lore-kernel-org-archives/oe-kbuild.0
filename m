Content-Type: multipart/mixed; boundary="===============7020275074528835996=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tglx-devel:devicemsi 44/46] drivers/base/platform-msi.c:468:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Wed, 09 Sep 2020 13:50:12 +0800
Message-ID: <202009091307.2jesHO2v%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7020275074528835996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git devi=
cemsi
head:   71cbf478eb6fe6a5dd4c13870a7922a191ec5ef9
commit: 3e23a5988eb9ffcf972c62125a2d6fe9ad233918 [44/46] platform-msi: Add =
device MSI infrastructure
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/base/platform-msi.c:468:6: warning: Variable 'ret' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    ret =3D __msi_domain_alloc_irqs(domain, dev, nvec);
        ^
   drivers/base/platform-msi.c:458:0: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    int i, ret =3D -ENOMEM;
   ^
   drivers/base/platform-msi.c:468:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D __msi_domain_alloc_irqs(domain, dev, nvec);
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=
=3D3e23a5988eb9ffcf972c62125a2d6fe9ad233918
git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/t=
glx/devel.git
git fetch --no-tags tglx-devel devicemsi
git checkout 3e23a5988eb9ffcf972c62125a2d6fe9ad233918
vim +/ret +468 drivers/base/platform-msi.c

3e23a5988eb9ff Thomas Gleixner 2020-08-21  447  =

3e23a5988eb9ff Thomas Gleixner 2020-08-21  448  /**
3e23a5988eb9ff Thomas Gleixner 2020-08-21  449   * device_msi_alloc_irqs - =
Allocate MSI interrupts for a device
3e23a5988eb9ff Thomas Gleixner 2020-08-21  450   * @dev:	Pointer to the dev=
ice
3e23a5988eb9ff Thomas Gleixner 2020-08-21  451   * @nvec:	Number of vectors
3e23a5988eb9ff Thomas Gleixner 2020-08-21  452   *
3e23a5988eb9ff Thomas Gleixner 2020-08-21  453   * Allocates the required n=
umber of MSI descriptors and the corresponding
3e23a5988eb9ff Thomas Gleixner 2020-08-21  454   * interrupt descriptors.
3e23a5988eb9ff Thomas Gleixner 2020-08-21  455   */
3e23a5988eb9ff Thomas Gleixner 2020-08-21  456  static int device_msi_alloc=
_irqs(struct irq_domain *domain, struct device *dev, int nvec)
3e23a5988eb9ff Thomas Gleixner 2020-08-21  457  {
3e23a5988eb9ff Thomas Gleixner 2020-08-21  458  	int i, ret =3D -ENOMEM;
3e23a5988eb9ff Thomas Gleixner 2020-08-21  459  =

3e23a5988eb9ff Thomas Gleixner 2020-08-21  460  	for (i =3D 0; i < nvec; i+=
+) {
3e23a5988eb9ff Thomas Gleixner 2020-08-21  461  		struct msi_desc *entry =
=3D alloc_msi_entry(dev, 1, NULL);
3e23a5988eb9ff Thomas Gleixner 2020-08-21  462  =

3e23a5988eb9ff Thomas Gleixner 2020-08-21  463  		if (!entry)
3e23a5988eb9ff Thomas Gleixner 2020-08-21  464  			goto fail;
3e23a5988eb9ff Thomas Gleixner 2020-08-21  465  		list_add_tail(&entry->lis=
t, dev_to_msi_list(dev));
3e23a5988eb9ff Thomas Gleixner 2020-08-21  466  	}
3e23a5988eb9ff Thomas Gleixner 2020-08-21  467  =

3e23a5988eb9ff Thomas Gleixner 2020-08-21 @468  	ret =3D __msi_domain_alloc=
_irqs(domain, dev, nvec);
3e23a5988eb9ff Thomas Gleixner 2020-08-21  469  	if (!ret)
3e23a5988eb9ff Thomas Gleixner 2020-08-21  470  		return 0;
3e23a5988eb9ff Thomas Gleixner 2020-08-21  471  fail:
3e23a5988eb9ff Thomas Gleixner 2020-08-21  472  	device_msi_free_msi_entrie=
s(dev);
3e23a5988eb9ff Thomas Gleixner 2020-08-21  473  	return ret;
3e23a5988eb9ff Thomas Gleixner 2020-08-21  474  }
3e23a5988eb9ff Thomas Gleixner 2020-08-21  475  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7020275074528835996==--

