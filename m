Content-Type: multipart/mixed; boundary="===============3866409944324659556=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V2 5/6] blk-mq: prepare for implementing hctx table via xarray
Date: Thu, 03 Mar 2022 20:33:22 +0800
Message-ID: <202203032010.V1VcXGQT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3866409944324659556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220302121407.1361401-6-ming.lei@redhat.com>
References: <20220302121407.1361401-6-ming.lei@redhat.com>
TO: Ming Lei <ming.lei@redhat.com>
TO: Jens Axboe <axboe@kernel.dk>
CC: linux-block(a)vger.kernel.org
CC: Yu Kuai <yukuai3@huawei.com>
CC: Ming Lei <ming.lei@redhat.com>

Hi Ming,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on v5.17-rc6 next-20220302]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ming-Lei/blk-mq-update_nr_=
hw_queues-related-improvement-bugfix/20220302-201636
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/blk-mq-sysfs.c:282:13: warning: Unsigned variable '--' can't be ne=
gative so it is unnecessary to test it. [unsignedPositive]
    while (--i >=3D 0)
               ^

vim +282 block/blk-mq-sysfs.c

67aec14ce87fe25 Jens Axboe      2014-05-30  254  =

2d0364c8c1a97a1 Bart Van Assche 2017-04-26  255  int __blk_mq_register_dev(=
struct device *dev, struct request_queue *q)
320ae51feed5c2f Jens Axboe      2013-10-24  256  {
320ae51feed5c2f Jens Axboe      2013-10-24  257  	struct blk_mq_hw_ctx *hct=
x;
44849be579332ce Ming Lei        2022-03-02  258  	unsigned long i;
44849be579332ce Ming Lei        2022-03-02  259  	int ret;
320ae51feed5c2f Jens Axboe      2013-10-24  260  =

2d0364c8c1a97a1 Bart Van Assche 2017-04-26  261  	WARN_ON_ONCE(!q->kobj.par=
ent);
cecf5d87ff20351 Ming Lei        2019-08-27  262  	lockdep_assert_held(&q->s=
ysfs_dir_lock);
4593fdbe7a2f44d Akinobu Mita    2015-09-27  263  =

1db4909e76f64a8 Ming Lei        2018-11-20  264  	ret =3D kobject_add(q->mq=
_kobj, kobject_get(&dev->kobj), "%s", "mq");
320ae51feed5c2f Jens Axboe      2013-10-24  265  	if (ret < 0)
4593fdbe7a2f44d Akinobu Mita    2015-09-27  266  		goto out;
320ae51feed5c2f Jens Axboe      2013-10-24  267  =

1db4909e76f64a8 Ming Lei        2018-11-20  268  	kobject_uevent(q->mq_kobj=
, KOBJ_ADD);
320ae51feed5c2f Jens Axboe      2013-10-24  269  =

320ae51feed5c2f Jens Axboe      2013-10-24  270  	queue_for_each_hw_ctx(q, =
hctx, i) {
67aec14ce87fe25 Jens Axboe      2014-05-30  271  		ret =3D blk_mq_register_=
hctx(hctx);
320ae51feed5c2f Jens Axboe      2013-10-24  272  		if (ret)
f05d1ba7871a2c2 Bart Van Assche 2017-04-26  273  			goto unreg;
320ae51feed5c2f Jens Axboe      2013-10-24  274  	}
320ae51feed5c2f Jens Axboe      2013-10-24  275  =

4593fdbe7a2f44d Akinobu Mita    2015-09-27  276  	q->mq_sysfs_init_done =3D=
 true;
2d0364c8c1a97a1 Bart Van Assche 2017-04-26  277  =

4593fdbe7a2f44d Akinobu Mita    2015-09-27  278  out:
2d0364c8c1a97a1 Bart Van Assche 2017-04-26  279  	return ret;
f05d1ba7871a2c2 Bart Van Assche 2017-04-26  280  =

f05d1ba7871a2c2 Bart Van Assche 2017-04-26  281  unreg:
f05d1ba7871a2c2 Bart Van Assche 2017-04-26 @282  	while (--i >=3D 0)
f05d1ba7871a2c2 Bart Van Assche 2017-04-26  283  		blk_mq_unregister_hctx(q=
->queue_hw_ctx[i]);
f05d1ba7871a2c2 Bart Van Assche 2017-04-26  284  =

1db4909e76f64a8 Ming Lei        2018-11-20  285  	kobject_uevent(q->mq_kobj=
, KOBJ_REMOVE);
1db4909e76f64a8 Ming Lei        2018-11-20  286  	kobject_del(q->mq_kobj);
f05d1ba7871a2c2 Bart Van Assche 2017-04-26  287  	kobject_put(&dev->kobj);
f05d1ba7871a2c2 Bart Van Assche 2017-04-26  288  	return ret;
2d0364c8c1a97a1 Bart Van Assche 2017-04-26  289  }
2d0364c8c1a97a1 Bart Van Assche 2017-04-26  290  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3866409944324659556==--

