Content-Type: multipart/mixed; boundary="===============0350150176675551689=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 11/12] misc: fastrpc: Add dma handle implementation
Date: Thu, 27 Jan 2022 21:09:26 +0800
Message-ID: <202201272146.Ci8W6Th6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0350150176675551689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220126135304.16340-12-srinivas.kandagatla@linaro.org>
References: <20220126135304.16340-12-srinivas.kandagatla@linaro.org>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
TO: robh+dt(a)kernel.org
TO: gregkh(a)linuxfoundation.org
CC: devicetree(a)vger.kernel.org
CC: ekangupt(a)qti.qualcomm.com
CC: bkumar(a)qti.qualcomm.com
CC: linux-kernel(a)vger.kernel.org
CC: srini(a)kernel.org
CC: bjorn.andersson(a)linaro.org
CC: linux-arm-msm(a)vger.kernel.org
CC: Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>

Hi Srinivas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on robh/for-next linux/master linus/master v5.17-r=
c1 next-20220127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Srinivas-Kandagatla/misc-f=
astrpc-Add-missing-DSP-FastRPC-features/20220126-215705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t 515a2f507491e7c3818e74ef4f4e088c1fecb190
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: openrisc-randconfig-m031-20220124 (https://download.01.org/0day-ci/=
archive/20220127/202201272146.Ci8W6Th6-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/misc/fastrpc.c:1856 fastrpc_req_mem_map() warn: variable dereferenc=
ed before check 'map' (see line 1834)

Old smatch warnings:
drivers/misc/fastrpc.c:578 fastrpc_context_alloc() warn: should 'ret << 4' =
be a 64 bit type?
drivers/misc/fastrpc.c:2013 fastrpc_device_register() warn: passing devm_ a=
llocated variable to kfree. 'fdev'

vim +/map +1856 drivers/misc/fastrpc.c

b1c0b7969aa491 Jeya R              2022-01-26  1783  =

b1c0b7969aa491 Jeya R              2022-01-26  1784  static int fastrpc_req=
_mem_map(struct fastrpc_user *fl, char __user *argp)
b1c0b7969aa491 Jeya R              2022-01-26  1785  {
b1c0b7969aa491 Jeya R              2022-01-26  1786  	struct fastrpc_invoke=
_args args[4] =3D { [0 ... 3] =3D { 0 } };
b1c0b7969aa491 Jeya R              2022-01-26  1787  	struct fastrpc_mem_ma=
p_req_msg req_msg =3D { 0 };
b1c0b7969aa491 Jeya R              2022-01-26  1788  	struct fastrpc_mmap_r=
sp_msg rsp_msg =3D { 0 };
b1c0b7969aa491 Jeya R              2022-01-26  1789  	struct fastrpc_mem_un=
map req_unmap =3D { 0 };
b1c0b7969aa491 Jeya R              2022-01-26  1790  	struct fastrpc_phy_pa=
ge pages =3D { 0 };
b1c0b7969aa491 Jeya R              2022-01-26  1791  	struct fastrpc_mem_ma=
p req;
b1c0b7969aa491 Jeya R              2022-01-26  1792  	struct device *dev =
=3D fl->sctx->dev;
b1c0b7969aa491 Jeya R              2022-01-26  1793  	struct fastrpc_map *m=
ap =3D NULL;
b1c0b7969aa491 Jeya R              2022-01-26  1794  	int err;
b1c0b7969aa491 Jeya R              2022-01-26  1795  	u32 sc;
b1c0b7969aa491 Jeya R              2022-01-26  1796  =

b1c0b7969aa491 Jeya R              2022-01-26  1797  	if (copy_from_user(&r=
eq, argp, sizeof(req)))
b1c0b7969aa491 Jeya R              2022-01-26  1798  		return -EFAULT;
b1c0b7969aa491 Jeya R              2022-01-26  1799  =

b1c0b7969aa491 Jeya R              2022-01-26  1800  	/* create SMMU mappin=
g */
e52e7cb4a5a6f3 Srinivas Kandagatla 2022-01-26  1801  	err =3D fastrpc_map_c=
reate(fl, req.fd, req.length, 0, &map);
b1c0b7969aa491 Jeya R              2022-01-26  1802  	if (err) {
b1c0b7969aa491 Jeya R              2022-01-26  1803  		dev_err(dev, "failed=
 to map buffer, fd =3D %d\n", req.fd);
b1c0b7969aa491 Jeya R              2022-01-26  1804  		return err;
b1c0b7969aa491 Jeya R              2022-01-26  1805  	}
b1c0b7969aa491 Jeya R              2022-01-26  1806  =

b1c0b7969aa491 Jeya R              2022-01-26  1807  	req_msg.pgid =3D fl->=
tgid;
b1c0b7969aa491 Jeya R              2022-01-26  1808  	req_msg.fd =3D req.fd;
b1c0b7969aa491 Jeya R              2022-01-26  1809  	req_msg.offset =3D re=
q.offset;
b1c0b7969aa491 Jeya R              2022-01-26  1810  	req_msg.vaddrin =3D r=
eq.vaddrin;
b1c0b7969aa491 Jeya R              2022-01-26  1811  	map->va =3D (void *) =
req.vaddrin;
b1c0b7969aa491 Jeya R              2022-01-26  1812  	req_msg.flags =3D req=
.flags;
b1c0b7969aa491 Jeya R              2022-01-26  1813  	req_msg.num =3D sizeo=
f(pages);
b1c0b7969aa491 Jeya R              2022-01-26  1814  	req_msg.data_len =3D =
0;
b1c0b7969aa491 Jeya R              2022-01-26  1815  =

b1c0b7969aa491 Jeya R              2022-01-26  1816  	args[0].ptr =3D (u64)=
 &req_msg;
b1c0b7969aa491 Jeya R              2022-01-26  1817  	args[0].length =3D si=
zeof(req_msg);
b1c0b7969aa491 Jeya R              2022-01-26  1818  =

b1c0b7969aa491 Jeya R              2022-01-26  1819  	pages.addr =3D map->p=
hys;
b1c0b7969aa491 Jeya R              2022-01-26  1820  	pages.size =3D map->s=
ize;
b1c0b7969aa491 Jeya R              2022-01-26  1821  =

b1c0b7969aa491 Jeya R              2022-01-26  1822  	args[1].ptr =3D (u64)=
 &pages;
b1c0b7969aa491 Jeya R              2022-01-26  1823  	args[1].length =3D si=
zeof(pages);
b1c0b7969aa491 Jeya R              2022-01-26  1824  =

b1c0b7969aa491 Jeya R              2022-01-26  1825  	args[2].ptr =3D (u64)=
 &pages;
b1c0b7969aa491 Jeya R              2022-01-26  1826  	args[2].length =3D 0;
b1c0b7969aa491 Jeya R              2022-01-26  1827  =

b1c0b7969aa491 Jeya R              2022-01-26  1828  	args[3].ptr =3D (u64)=
 &rsp_msg;
b1c0b7969aa491 Jeya R              2022-01-26  1829  	args[3].length =3D si=
zeof(rsp_msg);
b1c0b7969aa491 Jeya R              2022-01-26  1830  =

b1c0b7969aa491 Jeya R              2022-01-26  1831  	sc =3D FASTRPC_SCALAR=
S(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
b1c0b7969aa491 Jeya R              2022-01-26  1832  	err =3D fastrpc_inter=
nal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, &args[0]);
b1c0b7969aa491 Jeya R              2022-01-26  1833  	if (err) {
b1c0b7969aa491 Jeya R              2022-01-26 @1834  		dev_err(dev, "mem mm=
ap error, fd %d, vaddr %llx, size %lld\n",
b1c0b7969aa491 Jeya R              2022-01-26  1835  			req.fd, req.vaddrin=
, map->size);
b1c0b7969aa491 Jeya R              2022-01-26  1836  		goto err_invoke;
b1c0b7969aa491 Jeya R              2022-01-26  1837  	}
b1c0b7969aa491 Jeya R              2022-01-26  1838  =

b1c0b7969aa491 Jeya R              2022-01-26  1839  	/* update the buffer =
to be able to deallocate the memory on the DSP */
b1c0b7969aa491 Jeya R              2022-01-26  1840  	map->raddr =3D rsp_ms=
g.vaddr;
b1c0b7969aa491 Jeya R              2022-01-26  1841  =

b1c0b7969aa491 Jeya R              2022-01-26  1842  	/* let the client kno=
w the address to use */
b1c0b7969aa491 Jeya R              2022-01-26  1843  	req.vaddrout =3D rsp_=
msg.vaddr;
b1c0b7969aa491 Jeya R              2022-01-26  1844  =

b1c0b7969aa491 Jeya R              2022-01-26  1845  	if (copy_to_user((voi=
d __user *)argp, &req, sizeof(req))) {
b1c0b7969aa491 Jeya R              2022-01-26  1846  		/* unmap the memory =
and release the buffer */
b1c0b7969aa491 Jeya R              2022-01-26  1847  		req_unmap.vaddr =3D =
(uintptr_t) rsp_msg.vaddr;
b1c0b7969aa491 Jeya R              2022-01-26  1848  		req_unmap.length =3D=
 map->size;
b1c0b7969aa491 Jeya R              2022-01-26  1849  		fastrpc_req_mem_unma=
p_impl(fl, &req_unmap);
b1c0b7969aa491 Jeya R              2022-01-26  1850  		return -EFAULT;
b1c0b7969aa491 Jeya R              2022-01-26  1851  	}
b1c0b7969aa491 Jeya R              2022-01-26  1852  =

b1c0b7969aa491 Jeya R              2022-01-26  1853  	return 0;
b1c0b7969aa491 Jeya R              2022-01-26  1854  =

b1c0b7969aa491 Jeya R              2022-01-26  1855  err_invoke:
b1c0b7969aa491 Jeya R              2022-01-26 @1856  	if (map)
b1c0b7969aa491 Jeya R              2022-01-26  1857  		fastrpc_map_put(map);
b1c0b7969aa491 Jeya R              2022-01-26  1858  =

b1c0b7969aa491 Jeya R              2022-01-26  1859  	return err;
b1c0b7969aa491 Jeya R              2022-01-26  1860  }
b1c0b7969aa491 Jeya R              2022-01-26  1861  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0350150176675551689==--

