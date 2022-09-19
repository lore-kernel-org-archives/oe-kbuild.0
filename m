Content-Type: multipart/mixed; boundary="===============8759547315118750524=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/sfc/siena/efx_common.c:767 efx_siena_reset_up() warn: missing error code 'rc'
Date: Tue, 20 Sep 2022 03:46:41 +0800
Message-ID: <202209200345.EsbfkOKJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8759547315118750524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Martin Habets <habetsm.xilinx@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: c5a13c319e10e795850b61bc7e3447b08024be2e sfc: Add a basic Siena mod=
ule
date:   4 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
config: csky-randconfig-m041-20220918 (https://download.01.org/0day-ci/arch=
ive/20220920/202209200345.EsbfkOKJ-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/sfc/siena/efx_common.c:767 efx_siena_reset_up() warn: =
missing error code 'rc'

vim +/rc +767 drivers/net/ethernet/sfc/siena/efx_common.c

6e173d3b4af9e88 Martin Habets 2022-05-09  743  =

6e173d3b4af9e88 Martin Habets 2022-05-09  744  /* This function will always=
 ensure that the locks acquired in
71ad88f661253f5 Martin Habets 2022-05-09  745   * efx_siena_reset_down() ar=
e released. A failure return code indicates
6e173d3b4af9e88 Martin Habets 2022-05-09  746   * that we were unable to re=
initialise the hardware, and the
6e173d3b4af9e88 Martin Habets 2022-05-09  747   * driver should be disabled=
. If ok is false, then the rx and tx
6e173d3b4af9e88 Martin Habets 2022-05-09  748   * engines are not restarted=
, pending a RESET_DISABLE.
6e173d3b4af9e88 Martin Habets 2022-05-09  749   */
71ad88f661253f5 Martin Habets 2022-05-09  750  int efx_siena_reset_up(struc=
t efx_nic *efx, enum reset_type method, bool ok)
6e173d3b4af9e88 Martin Habets 2022-05-09  751  {
6e173d3b4af9e88 Martin Habets 2022-05-09  752  	int rc;
6e173d3b4af9e88 Martin Habets 2022-05-09  753  =

6e173d3b4af9e88 Martin Habets 2022-05-09  754  	EFX_ASSERT_RESET_SERIALISED=
(efx);
6e173d3b4af9e88 Martin Habets 2022-05-09  755  =

6e173d3b4af9e88 Martin Habets 2022-05-09  756  	if (method =3D=3D RESET_TYP=
E_MCDI_TIMEOUT)
6e173d3b4af9e88 Martin Habets 2022-05-09  757  		efx->type->finish_flr(efx);
6e173d3b4af9e88 Martin Habets 2022-05-09  758  =

6e173d3b4af9e88 Martin Habets 2022-05-09  759  	/* Ensure that SRAM is init=
ialised even if we're disabling the device */
6e173d3b4af9e88 Martin Habets 2022-05-09  760  	rc =3D efx->type->init(efx);
6e173d3b4af9e88 Martin Habets 2022-05-09  761  	if (rc) {
6e173d3b4af9e88 Martin Habets 2022-05-09  762  		netif_err(efx, drv, efx->n=
et_dev, "failed to initialise NIC\n");
6e173d3b4af9e88 Martin Habets 2022-05-09  763  		goto fail;
6e173d3b4af9e88 Martin Habets 2022-05-09  764  	}
6e173d3b4af9e88 Martin Habets 2022-05-09  765  =

6e173d3b4af9e88 Martin Habets 2022-05-09  766  	if (!ok)
6e173d3b4af9e88 Martin Habets 2022-05-09 @767  		goto fail;
6e173d3b4af9e88 Martin Habets 2022-05-09  768  =

6e173d3b4af9e88 Martin Habets 2022-05-09  769  	if (efx->port_initialized &=
& method !=3D RESET_TYPE_INVISIBLE &&
6e173d3b4af9e88 Martin Habets 2022-05-09  770  	    method !=3D RESET_TYPE_=
DATAPATH) {
4d49e5cd4b095cd Martin Habets 2022-05-09  771  		rc =3D efx_siena_mcdi_port=
_reconfigure(efx);
6e173d3b4af9e88 Martin Habets 2022-05-09  772  		if (rc && rc !=3D -EPERM)
6e173d3b4af9e88 Martin Habets 2022-05-09  773  			netif_err(efx, drv, efx->=
net_dev,
6e173d3b4af9e88 Martin Habets 2022-05-09  774  				  "could not restore PHY=
 settings\n");
6e173d3b4af9e88 Martin Habets 2022-05-09  775  	}
6e173d3b4af9e88 Martin Habets 2022-05-09  776  =

71ad88f661253f5 Martin Habets 2022-05-09  777  	rc =3D efx_siena_enable_int=
errupts(efx);
6e173d3b4af9e88 Martin Habets 2022-05-09  778  	if (rc)
6e173d3b4af9e88 Martin Habets 2022-05-09  779  		goto fail;
6e173d3b4af9e88 Martin Habets 2022-05-09  780  =


:::::: The code at line 767 was first introduced by commit
:::::: 6e173d3b4af9e8804ebdbdb7a4afd7ed8f96220b sfc: Copy shared files need=
ed for Siena (part 1)

:::::: TO: Martin Habets <habetsm.xilinx@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8759547315118750524==--

