Content-Type: multipart/mixed; boundary="===============4797700837866265915=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/4] of: add struct page support to rmem
Date: Mon, 18 Jul 2022 17:26:43 +0800
Message-ID: <202207181758.YyEzUSPl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4797700837866265915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220711122459.13773-2-me@linux.beauty>
References: <20220711122459.13773-2-me@linux.beauty>
TO: Li Chen <me@linux.beauty>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Frank Rowand <frowand.list@gmail.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Li Chen <lchen@ambarella.com>
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org

Hi Li,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core arm-perf/for-next/perf linu=
s/master v5.19-rc7 next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Chen/add-struct-p=
age-and-Direct-I-O-support-to-reserved-memory/20220711-202957
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: nios2-randconfig-m031-20220717 (https://download.01.org/0day-ci/arc=
hive/20220718/202207181758.YyEzUSPl-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/of/of_reserved_mem.c:472 get_reserved_mem_from_dev() error: passing=
 non negative 22 to ERR_PTR

vim +472 drivers/of/of_reserved_mem.c

8b66b4b9614f1c7 Li Chen 2022-07-11  448  =

8b66b4b9614f1c7 Li Chen 2022-07-11  449  /**
8b66b4b9614f1c7 Li Chen 2022-07-11  450   * get_reserved_mem_from_dev() - g=
et reserved_mem from a device node
8b66b4b9614f1c7 Li Chen 2022-07-11  451   * @dev: device pointer
8b66b4b9614f1c7 Li Chen 2022-07-11  452   *
8b66b4b9614f1c7 Li Chen 2022-07-11  453   * This function look for reserved=
_mem from given device.
8b66b4b9614f1c7 Li Chen 2022-07-11  454   *
8b66b4b9614f1c7 Li Chen 2022-07-11  455   * Returns a reserved_mem pointer,=
 or NULL on error.
8b66b4b9614f1c7 Li Chen 2022-07-11  456   */
8b66b4b9614f1c7 Li Chen 2022-07-11  457  struct reserved_mem *get_reserved_=
mem_from_dev(struct device *dev)
8b66b4b9614f1c7 Li Chen 2022-07-11  458  {
8b66b4b9614f1c7 Li Chen 2022-07-11  459  	struct device_node *np =3D dev_of=
_node(dev);
8b66b4b9614f1c7 Li Chen 2022-07-11  460  	struct device_node *rmem_np;
8b66b4b9614f1c7 Li Chen 2022-07-11  461  	struct reserved_mem *rmem =3D NUL=
L;
8b66b4b9614f1c7 Li Chen 2022-07-11  462  =

8b66b4b9614f1c7 Li Chen 2022-07-11  463  	rmem_np =3D of_parse_phandle(np, =
"memory-region", 0);
8b66b4b9614f1c7 Li Chen 2022-07-11  464  	if (!rmem_np) {
8b66b4b9614f1c7 Li Chen 2022-07-11  465  		dev_err(dev, "failed to get memo=
ry region node\n");
8b66b4b9614f1c7 Li Chen 2022-07-11  466  		return ERR_PTR(-ENODEV);
8b66b4b9614f1c7 Li Chen 2022-07-11  467  	}
8b66b4b9614f1c7 Li Chen 2022-07-11  468  =

8b66b4b9614f1c7 Li Chen 2022-07-11  469  	rmem =3D of_reserved_mem_lookup(r=
mem_np);
8b66b4b9614f1c7 Li Chen 2022-07-11  470  	if (!rmem) {
8b66b4b9614f1c7 Li Chen 2022-07-11  471  		dev_err(dev, "Failed to lookup r=
eserved memory\n");
8b66b4b9614f1c7 Li Chen 2022-07-11 @472  		return ERR_PTR(EINVAL);
8b66b4b9614f1c7 Li Chen 2022-07-11  473  	}
8b66b4b9614f1c7 Li Chen 2022-07-11  474  	return rmem;
8b66b4b9614f1c7 Li Chen 2022-07-11  475  }
8b66b4b9614f1c7 Li Chen 2022-07-11  476  EXPORT_SYMBOL_GPL(get_reserved_mem=
_from_dev);
8b66b4b9614f1c7 Li Chen 2022-07-11  477  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4797700837866265915==--

