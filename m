Content-Type: multipart/mixed; boundary="===============8454360257315217833=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pm:acpica-osl 2/2] drivers/acpi/acpica/exregion.c:127 acpi_ex_system_memory_space_handler() error: uninitialized symbol 'map_length'.
Date: Tue, 30 Jun 2020 06:43:20 +0800
Message-ID: <202006300610.NRDf7uef%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8454360257315217833==
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
head:   c24adb4c6b822a36a6b83adf995ce9964e9fac7c
commit: c24adb4c6b822a36a6b83adf995ce9964e9fac7c [2/2] ACPICA: Preserve mem=
ory opregion mappings
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-m001-20200629 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/acpi/acpica/exregion.c:127 acpi_ex_system_memory_space_handler() er=
ror: uninitialized symbol 'map_length'.

# https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commi=
t/?id=3Dc24adb4c6b822a36a6b83adf995ce9964e9fac7c
git remote add pm https://git.kernel.org/pub/scm/linux/kernel/git/rafael/li=
nux-pm.git
git remote update pm
git checkout c24adb4c6b822a36a6b83adf995ce9964e9fac7c
vim +/map_length +127 drivers/acpi/acpica/exregion.c

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6   94  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6   95  	/*
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6   96  	 * Does the request fit into the cached memory mapping?
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6   97  	 * Is 1) Address below the current mapping? OR
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6   98  	 *    2) Address beyond the current mapping?
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6   99  	 */
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  100  	if (!mm || (address < mm->physical_address) ||
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  101  	    ((u64) address + length > (u64) mm->physical_address + mm->len=
gth)) {
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  102  		/*
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  103  		 * The request cannot be resolved by the current memory mapping.
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  104  		 *
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  105  		 * Look for an existing saved mapping covering the address range
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  106  		 * at hand.  If found, save it as the current one and carry out
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  107  		 * the access.
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  108  		 */
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  109  		for (mm =3D mem_info->first_mm; mm; mm =3D mm->next_mm) {
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  110  			if (mm =3D=3D mem_info->cur_mm)
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  111  				continue;
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  112  =

c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  113  			if (address < mm->physical_address)
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  114  				continue;
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  115  =

c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  116  			if ((u64) address + length >
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  117  					(u64) mm->physical_address + mm->length)
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  118  				continue;
52fc0b026e99b5 drivers/acpi/executer/exregion.c Bob Moore         2006-10-0=
2  119  =

c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  120  			mem_info->cur_mm =3D mm;
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  121  			goto access;
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  122  		}
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  123  =

c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  124  		/* Create a new mappings list entry */
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  125  		mm =3D ACPI_ALLOCATE_ZEROED(sizeof(*mm));
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  126  		if (!mm) {
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9 @127  			ACPI_ERROR((AE_INFO,
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  128  				    "Unable to save memory mapping at 0x%8.8X%8.8X, size %u",
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  129  				    ACPI_FORMAT_UINT64(address),
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  130  				    (u32)map_length));
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  131  			return_ACPI_STATUS(AE_NO_MEMORY);
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  132  		}
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  133  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  134  		/*
75c8044fb38051 drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-1=
9  135  		 * October 2009: Attempt to map from the requested address to the
75c8044fb38051 drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-1=
9  136  		 * end of the region. However, we will never map more than one
75c8044fb38051 drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-1=
9  137  		 * page, nor will we cross a page boundary.
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  138  		 */
d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  139  		map_length =3D (acpi_size)
44f6c01242da4e drivers/acpi/executer/exregion.c Robert Moore      2005-04-1=
8  140  		    ((mem_info->address + mem_info->length) - address);
44f6c01242da4e drivers/acpi/executer/exregion.c Robert Moore      2005-04-1=
8  141  =

d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  142  		/*
d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  143  		 * If mapping the entire remaining portion of the region will cro=
ss
d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  144  		 * a page boundary, just map up to the page boundary, do not cros=
s.
d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  145  		 * On some systems, crossing a page boundary while mapping regions
d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  146  		 * can cause warnings if the pages have different attributes
75c8044fb38051 drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-1=
9  147  		 * due to resource management.
75c8044fb38051 drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-1=
9  148  		 *
75c8044fb38051 drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-1=
9  149  		 * This has the added benefit of constraining a single mapping to
75c8044fb38051 drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-1=
9  150  		 * one page, which is similar to the original code that used a 4k
75c8044fb38051 drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-1=
9  151  		 * maximum window.
d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  152  		 */
938ed1029a866e drivers/acpi/acpica/exregion.c   Bob Moore         2015-04-1=
3  153  		page_boundary_map_length =3D (acpi_size)
938ed1029a866e drivers/acpi/acpica/exregion.c   Bob Moore         2015-04-1=
3  154  		    (ACPI_ROUND_UP(address, ACPI_DEFAULT_PAGE_SIZE) - address);
739dcbb90a347a drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-2=
0  155  		if (page_boundary_map_length =3D=3D 0) {
d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  156  			page_boundary_map_length =3D ACPI_DEFAULT_PAGE_SIZE;
d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  157  		}
d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  158  =

d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  159  		if (map_length > page_boundary_map_length) {
d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  160  			map_length =3D page_boundary_map_length;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  161  		}
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  162  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  163  		/* Create a new mapping starting at the address given */
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  164  =

c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  165  		logical_addr_ptr =3D acpi_os_map_memory(address, map_length);
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  166  		if (!logical_addr_ptr) {
b8e4d89357fc43 drivers/acpi/executer/exregion.c Bob Moore         2006-01-2=
7  167  			ACPI_ERROR((AE_INFO,
f6a22b0bc41704 drivers/acpi/acpica/exregion.c   Bob Moore         2010-03-0=
5  168  				    "Could not map memory at 0x%8.8X%8.8X, size %u",
1d0a0b2f6df2bf drivers/acpi/acpica/exregion.c   Lv Zheng          2015-04-1=
3  169  				    ACPI_FORMAT_UINT64(address),
d410ee5109a163 drivers/acpi/acpica/exregion.c   Bob Moore         2009-10-2=
2  170  				    (u32)map_length));
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  171  			ACPI_FREE(mm);
f3d2e7865c8162 drivers/acpi/executer/exregion.c Bob Moore         2007-02-0=
2  172  			return_ACPI_STATUS(AE_NO_MEMORY);
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  173  		}
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  174  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  175  		/* Save the physical address and mapping size */
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  176  =

c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  177  		mm->logical_address =3D logical_addr_ptr;
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  178  		mm->physical_address =3D address;
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  179  		mm->length =3D map_length;
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  180  =

c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  181  		/*
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  182  		 * Add the new entry to the mappigs list and save it as the
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  183  		 * current mapping.
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  184  		 */
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  185  		mm->next_mm =3D mem_info->first_mm;
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  186  		mem_info->first_mm =3D mm;
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  187  =

c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  188  		mem_info->cur_mm =3D mm;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  189  	}
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  190  =

c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  191  access:
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  192  	/*
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  193  	 * Generate a logical pointer corresponding to the address we want=
 to
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  194  	 * access
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  195  	 */
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  196  	logical_addr_ptr =3D mm->logical_address +
c24adb4c6b822a drivers/acpi/acpica/exregion.c   Rafael J. Wysocki 2020-06-2=
9  197  		((u64) address - (u64) mm->physical_address);
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  198  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  199  	ACPI_DEBUG_PRINT((ACPI_DB_INFO,
b27d65975c252f drivers/acpi/acpica/exregion.c   Bob Moore         2010-05-2=
6  200  			  "System-Memory (width %u) R/W %u Address=3D%8.8X%8.8X\n",
1d0a0b2f6df2bf drivers/acpi/acpica/exregion.c   Lv Zheng          2015-04-1=
3  201  			  bit_width, function, ACPI_FORMAT_UINT64(address)));
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  202  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  203  	/*
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  204  	 * Perform the memory read or write
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  205  	 *
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  206  	 * Note: For machines that do not support non-aligned transfers, t=
he target
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  207  	 * address was checked for alignment above. We do not attempt to b=
reak the
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  208  	 * transfer up into smaller (byte-size) chunks because the AML spe=
cifically
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  209  	 * asked for a transfer width that the hardware may require.
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  210  	 */
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  211  	switch (function) {
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  212  	case ACPI_READ:
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  213  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  214  		*value =3D 0;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  215  		switch (bit_width) {
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  216  		case 8:
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  217  =

5df7e6cb42da36 drivers/acpi/acpica/exregion.c   Bob Moore         2010-01-2=
1  218  			*value =3D (u64)ACPI_GET8(logical_addr_ptr);
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  219  			break;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  220  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  221  		case 16:
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  222  =

5df7e6cb42da36 drivers/acpi/acpica/exregion.c   Bob Moore         2010-01-2=
1  223  			*value =3D (u64)ACPI_GET16(logical_addr_ptr);
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  224  			break;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  225  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  226  		case 32:
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  227  =

5df7e6cb42da36 drivers/acpi/acpica/exregion.c   Bob Moore         2010-01-2=
1  228  			*value =3D (u64)ACPI_GET32(logical_addr_ptr);
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  229  			break;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  230  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  231  		case 64:
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  232  =

5df7e6cb42da36 drivers/acpi/acpica/exregion.c   Bob Moore         2010-01-2=
1  233  			*value =3D (u64)ACPI_GET64(logical_addr_ptr);
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  234  			break;
59fa85057e12ff drivers/acpi/executer/exregion.c Bob Moore         2007-02-0=
2  235  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  236  		default:
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  237  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  238  			/* bit_width was already validated */
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  239  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  240  			break;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  241  		}
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  242  		break;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  243  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  244  	case ACPI_WRITE:
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  245  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  246  		switch (bit_width) {
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  247  		case 8:
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  248  =

57bf6aefc2b9c8 drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-1=
9  249  			ACPI_SET8(logical_addr_ptr, *value);
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  250  			break;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  251  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  252  		case 16:
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  253  =

57bf6aefc2b9c8 drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-1=
9  254  			ACPI_SET16(logical_addr_ptr, *value);
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  255  			break;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  256  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  257  		case 32:
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  258  =

57bf6aefc2b9c8 drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-1=
9  259  			ACPI_SET32(logical_addr_ptr, *value);
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  260  			break;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  261  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  262  		case 64:
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  263  =

57bf6aefc2b9c8 drivers/acpi/acpica/exregion.c   Lv Zheng          2012-12-1=
9  264  			ACPI_SET64(logical_addr_ptr, *value);
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  265  			break;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  266  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  267  		default:
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  268  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  269  			/* bit_width was already validated */
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  270  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  271  			break;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  272  		}
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  273  		break;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  274  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  275  	default:
1d1ea1b723d9f2 drivers/acpi/acpica/exregion.c   Chao Guan         2013-06-0=
8  276  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  277  		status =3D AE_BAD_PARAMETER;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  278  		break;
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  279  	}
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  280  =

^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  281  	return_ACPI_STATUS(status);
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  282  }
^1da177e4c3f41 drivers/acpi/executer/exregion.c Linus Torvalds    2005-04-1=
6  283  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8454360257315217833==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8454360257315217833==--

