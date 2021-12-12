Content-Type: multipart/mixed; boundary="===============3364197269440085968=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/common/memory.c:1422 mem_ioctl_no_mmu() error: uninitialized symbol 'block_size'.
Date: Sun, 12 Dec 2021 14:27:39 +0800
Message-ID: <202112121431.tDvBtbT7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3364197269440085968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 6df50d274363aa189a31435024339b781a6e32a9 habanalabs: return block s=
ize + block ID
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-m001-20211207 (https://download.01.org/0day-ci/ar=
chive/20211212/202112121431.tDvBtbT7-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/misc/habanalabs/common/memory.c:1422 mem_ioctl_no_mmu() error: unin=
itialized symbol 'block_size'.
drivers/misc/habanalabs/common/memory.c:1531 hl_mem_ioctl() error: uninitia=
lized symbol 'block_size'.

vim +/block_size +1422 drivers/misc/habanalabs/common/memory.c

d00697fbe13ccc drivers/misc/habanalabs/common/memory.c Ofir Bitton     2021=
-01-05  1369  =

54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1370  static int mem_ioctl_no_mmu(struct hl_fpriv *hpriv, union hl_=
mem_args *args)
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1371  {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1372  	struct hl_device *hdev =3D hpriv->hdev;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1373  	struct hl_ctx *ctx =3D hpriv->ctx;
d00697fbe13ccc drivers/misc/habanalabs/common/memory.c Ofir Bitton     2021=
-01-05  1374  	u64 block_handle, device_addr =3D 0;
6df50d274363aa drivers/misc/habanalabs/common/memory.c Oded Gabbay     2021=
-02-05  1375  	u32 handle =3D 0, block_size;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1376  	int rc;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1377  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1378  	switch (args->in.op) {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1379  	case HL_MEM_OP_ALLOC:
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1380  		if (args->in.alloc.mem_size =3D=3D 0) {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1381  			dev_err(hdev->dev,
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1382  				"alloc size must be larger than 0\n");
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1383  			rc =3D -EINVAL;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1384  			goto out;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1385  		}
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1386  =

54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1387  		/* Force contiguous as there are no real MMU
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1388  		 * translations to overcome physical memory gaps
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1389  		 */
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1390  		args->in.flags |=3D HL_MEM_CONTIGUOUS;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1391  		rc =3D alloc_device_memory(ctx, &args->in, &handle);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1392  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1393  		memset(args, 0, sizeof(*args));
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1394  		args->out.handle =3D (__u64) handle;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1395  		break;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1396  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1397  	case HL_MEM_OP_FREE:
f19040ce418d6f drivers/misc/habanalabs/common/memory.c Omer Shpigelman 2020=
-12-09  1398  		rc =3D free_device_memory(ctx, &args->in);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1399  		break;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1400  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1401  	case HL_MEM_OP_MAP:
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1402  		if (args->in.flags & HL_MEM_USERPTR) {
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1403  			device_addr =3D args->in.map_host.host_virt_addr;
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1404  			rc =3D 0;
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1405  		} else {
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1406  			rc =3D get_paddr_from_handle(ctx, &args->in,
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1407  							&device_addr);
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1408  		}
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1409  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1410  		memset(args, 0, sizeof(*args));
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1411  		args->out.device_virt_addr =3D device_addr;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1412  		break;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1413  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1414  	case HL_MEM_OP_UNMAP:
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1415  		rc =3D 0;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1416  		break;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1417  =

d00697fbe13ccc drivers/misc/habanalabs/common/memory.c Ofir Bitton     2021=
-01-05  1418  	case HL_MEM_OP_MAP_BLOCK:
d00697fbe13ccc drivers/misc/habanalabs/common/memory.c Ofir Bitton     2021=
-01-05  1419  		rc =3D map_block(hdev, args->in.map_block.block_addr,
6df50d274363aa drivers/misc/habanalabs/common/memory.c Oded Gabbay     2021=
-02-05  1420  				&block_handle, &block_size);
6df50d274363aa drivers/misc/habanalabs/common/memory.c Oded Gabbay     2021=
-02-05  1421  		args->out.block_handle =3D block_handle;
6df50d274363aa drivers/misc/habanalabs/common/memory.c Oded Gabbay     2021=
-02-05 @1422  		args->out.block_size =3D block_size;
d00697fbe13ccc drivers/misc/habanalabs/common/memory.c Ofir Bitton     2021=
-01-05  1423  		break;
d00697fbe13ccc drivers/misc/habanalabs/common/memory.c Ofir Bitton     2021=
-01-05  1424  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1425  	default:
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1426  		dev_err(hdev->dev, "Unknown opcode for memory IOCTL\n");
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1427  		rc =3D -ENOTTY;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1428  		break;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1429  	}
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1430  =

54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1431  out:
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1432  	return rc;
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1433  }
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1434  =

54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1435  int hl_mem_ioctl(struct hl_fpriv *hpriv, void *data)
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1436  {
66a76401c50b26 drivers/misc/habanalabs/common/memory.c Ofir Bitton     2020=
-10-05  1437  	enum hl_device_status status;
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1438  	union hl_mem_args *args =3D data;
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1439  	struct hl_device *hdev =3D hpriv->hdev;
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1440  	struct hl_ctx *ctx =3D hpriv->ctx;
d00697fbe13ccc drivers/misc/habanalabs/common/memory.c Ofir Bitton     2021=
-01-05  1441  	u64 block_handle, device_addr =3D 0;
6df50d274363aa drivers/misc/habanalabs/common/memory.c Oded Gabbay     2021=
-02-05  1442  	u32 handle =3D 0, block_size;
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1443  	int rc;
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1444  =

66a76401c50b26 drivers/misc/habanalabs/common/memory.c Ofir Bitton     2020=
-10-05  1445  	if (!hl_device_operational(hdev, &status)) {
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1446  		dev_warn_ratelimited(hdev->dev,
3f5398cfbf051d drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-06  1447  			"Device is %s. Can't execute MEMORY IOCTL\n",
66a76401c50b26 drivers/misc/habanalabs/common/memory.c Ofir Bitton     2020=
-10-05  1448  			hdev->status[status]);
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1449  		return -EBUSY;
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1450  	}
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1451  =

54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1452  	if (!hdev->mmu_enable)
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1453  		return mem_ioctl_no_mmu(hpriv, args);
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1454  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1455  	switch (args->in.op) {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1456  	case HL_MEM_OP_ALLOC:
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1457  		if (args->in.alloc.mem_size =3D=3D 0) {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1458  			dev_err(hdev->dev,
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1459  				"alloc size must be larger than 0\n");
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1460  			rc =3D -EINVAL;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1461  			goto out;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1462  		}
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1463  =

3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1464  		/* If DRAM does not support virtual memory the driver won't
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1465  		 * handle the allocation/freeing of that memory. However, f=
or
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1466  		 * system administration/monitoring purposes, the driver wi=
ll
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1467  		 * keep track of the amount of DRAM memory that is allocated
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1468  		 * and freed by the user. Because this code totally relies =
on
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1469  		 * the user's input, the driver can't ensure the validity
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1470  		 * of this accounting.
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1471  		 */
7f070c913c361e drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-11-09  1472  		if (!hdev->asic_prop.dram_supports_virtual_memory) {
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1473  			atomic64_add(args->in.alloc.mem_size,
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1474  					&ctx->dram_phys_mem);
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1475  			atomic64_add(args->in.alloc.mem_size,
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1476  					&hdev->dram_used_mem);
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1477  =

3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1478  			dev_dbg(hdev->dev, "DRAM alloc is not supported\n");
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1479  			rc =3D 0;
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1480  =

3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1481  			memset(args, 0, sizeof(*args));
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1482  			args->out.handle =3D 0;
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1483  			goto out;
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1484  		}
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1485  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1486  		rc =3D alloc_device_memory(ctx, &args->in, &handle);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1487  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1488  		memset(args, 0, sizeof(*args));
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1489  		args->out.handle =3D (__u64) handle;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1490  		break;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1491  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1492  	case HL_MEM_OP_FREE:
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1493  		/* If DRAM does not support virtual memory the driver won't
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1494  		 * handle the allocation/freeing of that memory. However, f=
or
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1495  		 * system administration/monitoring purposes, the driver wi=
ll
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1496  		 * keep track of the amount of DRAM memory that is allocated
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1497  		 * and freed by the user. Because this code totally relies =
on
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1498  		 * the user's input, the driver can't ensure the validity
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1499  		 * of this accounting.
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1500  		 */
7f070c913c361e drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-11-09  1501  		if (!hdev->asic_prop.dram_supports_virtual_memory) {
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1502  			atomic64_sub(args->in.alloc.mem_size,
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1503  					&ctx->dram_phys_mem);
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1504  			atomic64_sub(args->in.alloc.mem_size,
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1505  					&hdev->dram_used_mem);
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1506  =

3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1507  			dev_dbg(hdev->dev, "DRAM alloc is not supported\n");
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1508  			rc =3D 0;
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1509  =

3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1510  			goto out;
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1511  		}
3e622996576312 drivers/misc/habanalabs/common/memory.c Oded Gabbay     2020=
-10-18  1512  =

f19040ce418d6f drivers/misc/habanalabs/common/memory.c Omer Shpigelman 2020=
-12-09  1513  		rc =3D free_device_memory(ctx, &args->in);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1514  		break;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1515  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1516  	case HL_MEM_OP_MAP:
54303a1aef95b0 drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-04-04  1517  		rc =3D map_device_va(ctx, &args->in, &device_addr);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1518  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1519  		memset(args, 0, sizeof(*args));
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1520  		args->out.device_virt_addr =3D device_addr;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1521  		break;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1522  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1523  	case HL_MEM_OP_UNMAP:
f19040ce418d6f drivers/misc/habanalabs/common/memory.c Omer Shpigelman 2020=
-12-09  1524  		rc =3D unmap_device_va(ctx, &args->in, false);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1525  		break;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1526  =

d00697fbe13ccc drivers/misc/habanalabs/common/memory.c Ofir Bitton     2021=
-01-05  1527  	case HL_MEM_OP_MAP_BLOCK:
d00697fbe13ccc drivers/misc/habanalabs/common/memory.c Ofir Bitton     2021=
-01-05  1528  		rc =3D map_block(hdev, args->in.map_block.block_addr,
6df50d274363aa drivers/misc/habanalabs/common/memory.c Oded Gabbay     2021=
-02-05  1529  				&block_handle, &block_size);
6df50d274363aa drivers/misc/habanalabs/common/memory.c Oded Gabbay     2021=
-02-05  1530  		args->out.block_handle =3D block_handle;
6df50d274363aa drivers/misc/habanalabs/common/memory.c Oded Gabbay     2021=
-02-05 @1531  		args->out.block_size =3D block_size;
d00697fbe13ccc drivers/misc/habanalabs/common/memory.c Ofir Bitton     2021=
-01-05  1532  		break;
d00697fbe13ccc drivers/misc/habanalabs/common/memory.c Ofir Bitton     2021=
-01-05  1533  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1534  	default:
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1535  		dev_err(hdev->dev, "Unknown opcode for memory IOCTL\n");
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1536  		rc =3D -ENOTTY;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1537  		break;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1538  	}
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1539  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1540  out:
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1541  	return rc;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c        Omer Shpigelman 2019=
-02-16  1542  }
eff6f4a0e70b7b drivers/misc/habanalabs/memory.c        Oded Gabbay     2019=
-02-16  1543  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3364197269440085968==--

