Content-Type: multipart/mixed; boundary="===============4599150423974637549=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] RDMA/rtrs: Fix double free in alloc_clt
Date: Mon, 24 Jan 2022 21:08:17 +0800
Message-ID: <202201242029.Oiu4ZZAL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4599150423974637549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220120103714.32108-1-linmq006@gmail.com>
References: <20220120103714.32108-1-linmq006@gmail.com>
TO: Miaoqian Lin <linmq006@gmail.com>

Hi Miaoqian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on v5.17-rc1 next-20220124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miaoqian-Lin/RDMA-rtrs-Fix=
-double-free-in-alloc_clt/20220120-183823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-n=
ext
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-m001-20220124 (https://download.01.org/0day-ci/ar=
chive/20220124/202201242029.Oiu4ZZAL-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/infiniband/ulp/rtrs/rtrs-clt.c:2767 alloc_clt() error: dereferencin=
g freed memory 'clt'

vim +/clt +2767 drivers/infiniband/ulp/rtrs/rtrs-clt.c

6a98d71daea186 Jack Wang        2020-05-11  2687  =

f3433d79cd50d3 Vaishali Thakkar 2022-01-05  2688  static struct rtrs_clt_se=
ss *alloc_clt(const char *sessname, size_t paths_num,
6a98d71daea186 Jack Wang        2020-05-11  2689  				  u16 port, size_t pd=
u_sz, void *priv,
6a98d71daea186 Jack Wang        2020-05-11  2690  				  void	(*link_ev)(voi=
d *priv,
6a98d71daea186 Jack Wang        2020-05-11  2691  						   enum rtrs_clt_li=
nk_ev ev),
6a98d71daea186 Jack Wang        2020-05-11  2692  				  unsigned int reconn=
ect_delay_sec,
6a98d71daea186 Jack Wang        2020-05-11  2693  				  unsigned int max_re=
connect_attempts)
6a98d71daea186 Jack Wang        2020-05-11  2694  {
f3433d79cd50d3 Vaishali Thakkar 2022-01-05  2695  	struct rtrs_clt_sess *cl=
t;
6a98d71daea186 Jack Wang        2020-05-11  2696  	int err;
6a98d71daea186 Jack Wang        2020-05-11  2697  =

6a98d71daea186 Jack Wang        2020-05-11  2698  	if (!paths_num || paths_=
num > MAX_PATHS_NUM)
6a98d71daea186 Jack Wang        2020-05-11  2699  		return ERR_PTR(-EINVAL);
6a98d71daea186 Jack Wang        2020-05-11  2700  =

6a98d71daea186 Jack Wang        2020-05-11  2701  	if (strlen(sessname) >=
=3D sizeof(clt->sessname))
6a98d71daea186 Jack Wang        2020-05-11  2702  		return ERR_PTR(-EINVAL);
6a98d71daea186 Jack Wang        2020-05-11  2703  =

6a98d71daea186 Jack Wang        2020-05-11  2704  	clt =3D kzalloc(sizeof(*=
clt), GFP_KERNEL);
6a98d71daea186 Jack Wang        2020-05-11  2705  	if (!clt)
6a98d71daea186 Jack Wang        2020-05-11  2706  		return ERR_PTR(-ENOMEM);
6a98d71daea186 Jack Wang        2020-05-11  2707  =

6a98d71daea186 Jack Wang        2020-05-11  2708  	clt->pcpu_path =3D alloc=
_percpu(typeof(*clt->pcpu_path));
6a98d71daea186 Jack Wang        2020-05-11  2709  	if (!clt->pcpu_path) {
6a98d71daea186 Jack Wang        2020-05-11  2710  		kfree(clt);
6a98d71daea186 Jack Wang        2020-05-11  2711  		return ERR_PTR(-ENOMEM);
6a98d71daea186 Jack Wang        2020-05-11  2712  	}
6a98d71daea186 Jack Wang        2020-05-11  2713  =

6a98d71daea186 Jack Wang        2020-05-11  2714  	uuid_gen(&clt->paths_uui=
d);
6a98d71daea186 Jack Wang        2020-05-11  2715  	INIT_LIST_HEAD_RCU(&clt-=
>paths_list);
6a98d71daea186 Jack Wang        2020-05-11  2716  	clt->paths_num =3D paths=
_num;
6a98d71daea186 Jack Wang        2020-05-11  2717  	clt->paths_up =3D MAX_PA=
THS_NUM;
6a98d71daea186 Jack Wang        2020-05-11  2718  	clt->port =3D port;
6a98d71daea186 Jack Wang        2020-05-11  2719  	clt->pdu_sz =3D pdu_sz;
6fc45596506b7a Jack Wang        2021-06-21  2720  	clt->max_segments =3D RT=
RS_MAX_SEGMENTS;
6a98d71daea186 Jack Wang        2020-05-11  2721  	clt->reconnect_delay_sec=
 =3D reconnect_delay_sec;
6a98d71daea186 Jack Wang        2020-05-11  2722  	clt->max_reconnect_attem=
pts =3D max_reconnect_attempts;
6a98d71daea186 Jack Wang        2020-05-11  2723  	clt->priv =3D priv;
6a98d71daea186 Jack Wang        2020-05-11  2724  	clt->link_ev =3D link_ev;
6a98d71daea186 Jack Wang        2020-05-11  2725  	clt->mp_policy =3D MP_PO=
LICY_MIN_INFLIGHT;
2d612f0d3d4b4c Dima Stepanov    2021-05-28  2726  	strscpy(clt->sessname, s=
essname, sizeof(clt->sessname));
6a98d71daea186 Jack Wang        2020-05-11  2727  	init_waitqueue_head(&clt=
->permits_wait);
6a98d71daea186 Jack Wang        2020-05-11  2728  	mutex_init(&clt->paths_e=
v_mutex);
6a98d71daea186 Jack Wang        2020-05-11  2729  	mutex_init(&clt->paths_m=
utex);
6a98d71daea186 Jack Wang        2020-05-11  2730  =

6a98d71daea186 Jack Wang        2020-05-11  2731  	clt->dev.class =3D rtrs_=
clt_dev_class;
6a98d71daea186 Jack Wang        2020-05-11  2732  	clt->dev.release =3D rtr=
s_clt_dev_release;
6a98d71daea186 Jack Wang        2020-05-11  2733  	err =3D dev_set_name(&cl=
t->dev, "%s", sessname);
eab098246625e9 Guoqing Jiang    2020-12-17  2734  	if (err)
eab098246625e9 Guoqing Jiang    2020-12-17  2735  		goto err;
6a98d71daea186 Jack Wang        2020-05-11  2736  	/*
6a98d71daea186 Jack Wang        2020-05-11  2737  	 * Suppress user space n=
otification until
6a98d71daea186 Jack Wang        2020-05-11  2738  	 * sysfs files are creat=
ed
6a98d71daea186 Jack Wang        2020-05-11  2739  	 */
6a98d71daea186 Jack Wang        2020-05-11  2740  	dev_set_uevent_suppress(=
&clt->dev, true);
6a98d71daea186 Jack Wang        2020-05-11  2741  	err =3D device_register(=
&clt->dev);
6a98d71daea186 Jack Wang        2020-05-11  2742  	if (err) {
6a98d71daea186 Jack Wang        2020-05-11  2743  		put_device(&clt->dev);
7580d72134cc8f Miaoqian Lin     2022-01-20  2744  		goto err_free_cpu;
6a98d71daea186 Jack Wang        2020-05-11  2745  	}
6a98d71daea186 Jack Wang        2020-05-11  2746  =

6a98d71daea186 Jack Wang        2020-05-11  2747  	clt->kobj_paths =3D kobj=
ect_create_and_add("paths", &clt->dev.kobj);
6a98d71daea186 Jack Wang        2020-05-11  2748  	if (!clt->kobj_paths) {
eab098246625e9 Guoqing Jiang    2020-12-17  2749  		err =3D -ENOMEM;
eab098246625e9 Guoqing Jiang    2020-12-17  2750  		goto err_dev;
6a98d71daea186 Jack Wang        2020-05-11  2751  	}
6a98d71daea186 Jack Wang        2020-05-11  2752  	err =3D rtrs_clt_create_=
sysfs_root_files(clt);
6a98d71daea186 Jack Wang        2020-05-11  2753  	if (err) {
6a98d71daea186 Jack Wang        2020-05-11  2754  		kobject_del(clt->kobj_p=
aths);
6a98d71daea186 Jack Wang        2020-05-11  2755  		kobject_put(clt->kobj_p=
aths);
eab098246625e9 Guoqing Jiang    2020-12-17  2756  		goto err_dev;
6a98d71daea186 Jack Wang        2020-05-11  2757  	}
6a98d71daea186 Jack Wang        2020-05-11  2758  	dev_set_uevent_suppress(=
&clt->dev, false);
6a98d71daea186 Jack Wang        2020-05-11  2759  	kobject_uevent(&clt->dev=
.kobj, KOBJ_ADD);
6a98d71daea186 Jack Wang        2020-05-11  2760  =

6a98d71daea186 Jack Wang        2020-05-11  2761  	return clt;
eab098246625e9 Guoqing Jiang    2020-12-17  2762  err_dev:
eab098246625e9 Guoqing Jiang    2020-12-17  2763  	device_unregister(&clt->=
dev);
eab098246625e9 Guoqing Jiang    2020-12-17  2764  err:
eab098246625e9 Guoqing Jiang    2020-12-17  2765  	free_percpu(clt->pcpu_pa=
th);
eab098246625e9 Guoqing Jiang    2020-12-17  2766  	kfree(clt);
7580d72134cc8f Miaoqian Lin     2022-01-20 @2767  	clt->pcpu_path =3D NULL;
7580d72134cc8f Miaoqian Lin     2022-01-20  2768  err_free_cpu:
7580d72134cc8f Miaoqian Lin     2022-01-20  2769  	free_percpu(clt->pcpu_pa=
th);
eab098246625e9 Guoqing Jiang    2020-12-17  2770  	return ERR_PTR(err);
6a98d71daea186 Jack Wang        2020-05-11  2771  }
6a98d71daea186 Jack Wang        2020-05-11  2772  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4599150423974637549==--

