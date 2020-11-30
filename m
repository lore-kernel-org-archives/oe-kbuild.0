Content-Type: multipart/mixed; boundary="===============3250350134031819350=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/platforms/powernv/pci-sriov.c:606:12: warning: Either the condition '!iov' is redundant or there is possible null pointer dereference: iov.
Date: Tue, 01 Dec 2020 06:18:41 +0800
Message-ID: <202012010634.Ld56B46z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3250350134031819350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Oliver O'Halloran" <oohall@gmail.com>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b65054597872ce3aefbc6a666385eabdf9e288da
commit: 052da31d45fc71238ea8bed7e9a84648a1ee0bf3 powerpc/powernv/sriov: De-=
indent setup and teardown
date:   4 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 months ago
compiler: powerpc64le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/powerpc/platforms/powernv/pci-sriov.c:606:12: warning: Either the c=
ondition '!iov' is redundant or there is possible null pointer dereference:=
 iov. [nullPointerRedundantCheck]
    num_vfs =3D iov->num_vfs;
              ^
   arch/powerpc/platforms/powernv/pci-sriov.c:609:14: note: Assuming that c=
ondition '!iov' is not redundant
    if (WARN_ON(!iov))
                ^
   arch/powerpc/platforms/powernv/pci-sriov.c:606:12: note: Null pointer de=
reference
    num_vfs =3D iov->num_vfs;
              ^
   arch/powerpc/platforms/powernv/pci-sriov.c:607:12: warning: Either the c=
ondition '!iov' is redundant or there is possible null pointer dereference:=
 iov. [nullPointerRedundantCheck]
    base_pe =3D iov->vf_pe_arr[0].pe_number;
              ^
   arch/powerpc/platforms/powernv/pci-sriov.c:609:14: note: Assuming that c=
ondition '!iov' is not redundant
    if (WARN_ON(!iov))
                ^
   arch/powerpc/platforms/powernv/pci-sriov.c:607:12: note: Null pointer de=
reference
    base_pe =3D iov->vf_pe_arr[0].pe_number;
              ^

vim +606 arch/powerpc/platforms/powernv/pci-sriov.c

37b59ef08c546c6 Oliver O'Halloran 2020-07-22  597  =

37b59ef08c546c6 Oliver O'Halloran 2020-07-22  598  static void pnv_pci_srio=
v_disable(struct pci_dev *pdev)
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  599  {
d29a2488d2c0200 Oliver O'Halloran 2020-07-22  600  	u16                    =
num_vfs, base_pe;
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  601  	struct pnv_phb        *=
phb;
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  602  	struct pnv_iov_data   *=
iov;
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  603  =

37b59ef08c546c6 Oliver O'Halloran 2020-07-22  604  	phb =3D pci_bus_to_pnvh=
b(pdev->bus);
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  605  	iov =3D pnv_iov_get(pde=
v);
37b59ef08c546c6 Oliver O'Halloran 2020-07-22 @606  	num_vfs =3D iov->num_vf=
s;
d29a2488d2c0200 Oliver O'Halloran 2020-07-22  607  	base_pe =3D iov->vf_pe_=
arr[0].pe_number;
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  608  =

052da31d45fc712 Oliver O'Halloran 2020-07-22  609  	if (WARN_ON(!iov))
052da31d45fc712 Oliver O'Halloran 2020-07-22  610  		return;
052da31d45fc712 Oliver O'Halloran 2020-07-22  611  =

37b59ef08c546c6 Oliver O'Halloran 2020-07-22  612  	/* Release VF PEs */
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  613  	pnv_ioda_release_vf_PE(=
pdev);
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  614  =

052da31d45fc712 Oliver O'Halloran 2020-07-22  615  	/* Un-shift the IOV BAR=
 resources */
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  616  	if (!iov->m64_single_mo=
de)
d29a2488d2c0200 Oliver O'Halloran 2020-07-22  617  		pnv_pci_vf_resource_sh=
ift(pdev, -base_pe);
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  618  =

37b59ef08c546c6 Oliver O'Halloran 2020-07-22  619  	/* Release M64 windows =
*/
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  620  	pnv_pci_vf_release_m64(=
pdev, num_vfs);
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  621  }
37b59ef08c546c6 Oliver O'Halloran 2020-07-22  622  =


:::::: The code at line 606 was first introduced by commit
:::::: 37b59ef08c546c6f54cdc52eed749f494619a102 powerpc/powernv/sriov: Move=
 SR-IOV into a separate file

:::::: TO: Oliver O'Halloran <oohall@gmail.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3250350134031819350==--

