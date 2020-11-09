Content-Type: multipart/mixed; boundary="===============0055337488022911137=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/block/null_blk_zoned.c:402:9: sparse: sparse: context imbalance in 'null_zone_write' - different lock contexts for basic block
Date: Tue, 10 Nov 2020 00:04:48 +0800
Message-ID: <202011100042.0xmN0bV5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0055337488022911137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Damien Le Moal <damien.lemoal@wdc.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f8394f232b1eab649ce2df5c5f15b0e528c92091
commit: e1777d099728a76a8f8090f89649aac961e7e530 null_blk: Fix scheduling i=
n atomic with zoned mode
date:   3 days ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
config: sh-randconfig-s031-20201109 (attached as .config)
compiler: sh4-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-76-gf680124b-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1777d099728a76a8f8090f89649aac961e7e530
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1777d099728a76a8f8090f89649aac961e7e530
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dsh =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> drivers/block/null_blk_zoned.c:402:9: sparse: sparse: context imbalance =
in 'null_zone_write' - different lock contexts for basic block

vim +/null_zone_write +402 drivers/block/null_blk_zoned.c

dc4d137ee3b79a Niklas Cassel      2020-08-28  324  =

fceb5d1b19cbe6 Chaitanya Kulkarni 2019-08-22  325  static blk_status_t null=
_zone_write(struct nullb_cmd *cmd, sector_t sector,
e0489ed5daeb48 Damien Le Moal     2020-05-12  326  				    unsigned int nr_=
sectors, bool append)
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  327  {
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  328  	struct nullb_devic=
e *dev =3D cmd->nq->dev;
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  329  	unsigned int zno =
=3D null_zone_no(dev, sector);
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  330  	struct blk_zone *z=
one =3D &dev->zones[zno];
9dd44c7e998e66 Damien Le Moal     2020-04-23  331  	blk_status_t ret;
9dd44c7e998e66 Damien Le Moal     2020-04-23  332  =

9dd44c7e998e66 Damien Le Moal     2020-04-23  333  	trace_nullb_zone_op(cmd=
, zno, zone->cond);
9dd44c7e998e66 Damien Le Moal     2020-04-23  334  =

9dd44c7e998e66 Damien Le Moal     2020-04-23  335  	if (zone->type =3D=3D B=
LK_ZONE_TYPE_CONVENTIONAL)
9dd44c7e998e66 Damien Le Moal     2020-04-23  336  		return null_process_cm=
d(cmd, REQ_OP_WRITE, sector, nr_sectors);
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  337  =

aa1c09cb65e2ed Damien Le Moal     2020-10-29  338  	null_lock_zone(dev, zno=
);
aa1c09cb65e2ed Damien Le Moal     2020-10-29  339  =

ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  340  	switch (zone->cond=
) {
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  341  	case BLK_ZONE_COND=
_FULL:
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  342  		/* Cannot write t=
o a full zone */
aa1c09cb65e2ed Damien Le Moal     2020-10-29  343  		ret =3D BLK_STS_IOERR;
aa1c09cb65e2ed Damien Le Moal     2020-10-29  344  		goto unlock;
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  345  	case BLK_ZONE_COND=
_EMPTY:
dc4d137ee3b79a Niklas Cassel      2020-08-28  346  	case BLK_ZONE_COND_CLOS=
ED:
fd78874b710f42 Keith Busch        2020-10-22  347  		ret =3D null_check_zon=
e_resources(dev, zone);
fd78874b710f42 Keith Busch        2020-10-22  348  		if (ret !=3D BLK_STS_O=
K)
aa1c09cb65e2ed Damien Le Moal     2020-10-29  349  			goto unlock;
dc4d137ee3b79a Niklas Cassel      2020-08-28  350  		break;
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  351  	case BLK_ZONE_COND=
_IMP_OPEN:
16c731fed6d8e5 Damien Le Moal     2020-01-09  352  	case BLK_ZONE_COND_EXP_=
OPEN:
dc4d137ee3b79a Niklas Cassel      2020-08-28  353  		break;
dc4d137ee3b79a Niklas Cassel      2020-08-28  354  	default:
dc4d137ee3b79a Niklas Cassel      2020-08-28  355  		/* Invalid zone condit=
ion */
aa1c09cb65e2ed Damien Le Moal     2020-10-29  356  		ret =3D BLK_STS_IOERR;
aa1c09cb65e2ed Damien Le Moal     2020-10-29  357  		goto unlock;
dc4d137ee3b79a Niklas Cassel      2020-08-28  358  	}
dc4d137ee3b79a Niklas Cassel      2020-08-28  359  =

e0489ed5daeb48 Damien Le Moal     2020-05-12  360  	/*
e0489ed5daeb48 Damien Le Moal     2020-05-12  361  	 * Regular writes must =
be at the write pointer position.
e0489ed5daeb48 Damien Le Moal     2020-05-12  362  	 * Zone append writes a=
re automatically issued at the write
e0489ed5daeb48 Damien Le Moal     2020-05-12  363  	 * pointer and the posi=
tion returned using the request or BIO
e0489ed5daeb48 Damien Le Moal     2020-05-12  364  	 * sector.
e0489ed5daeb48 Damien Le Moal     2020-05-12  365  	 */
e0489ed5daeb48 Damien Le Moal     2020-05-12  366  	if (append) {
e0489ed5daeb48 Damien Le Moal     2020-05-12  367  		sector =3D zone->wp;
e0489ed5daeb48 Damien Le Moal     2020-05-12  368  		if (cmd->bio)
e0489ed5daeb48 Damien Le Moal     2020-05-12  369  			cmd->bio->bi_iter.bi_=
sector =3D sector;
e0489ed5daeb48 Damien Le Moal     2020-05-12  370  		else
e0489ed5daeb48 Damien Le Moal     2020-05-12  371  			cmd->rq->__sector =3D=
 sector;
e0489ed5daeb48 Damien Le Moal     2020-05-12  372  	} else if (sector !=3D =
zone->wp) {
aa1c09cb65e2ed Damien Le Moal     2020-10-29  373  		ret =3D BLK_STS_IOERR;
aa1c09cb65e2ed Damien Le Moal     2020-10-29  374  		goto unlock;
e0489ed5daeb48 Damien Le Moal     2020-05-12  375  	}
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  376  =

aa1c09cb65e2ed Damien Le Moal     2020-10-29  377  	if (zone->wp + nr_secto=
rs > zone->start + zone->capacity) {
aa1c09cb65e2ed Damien Le Moal     2020-10-29  378  		ret =3D BLK_STS_IOERR;
aa1c09cb65e2ed Damien Le Moal     2020-10-29  379  		goto unlock;
aa1c09cb65e2ed Damien Le Moal     2020-10-29  380  	}
089565fbf3bba9 Aravind Ramesh     2020-06-29  381  =

dc4d137ee3b79a Niklas Cassel      2020-08-28  382  	if (zone->cond =3D=3D B=
LK_ZONE_COND_CLOSED) {
dc4d137ee3b79a Niklas Cassel      2020-08-28  383  		dev->nr_zones_closed--;
dc4d137ee3b79a Niklas Cassel      2020-08-28  384  		dev->nr_zones_imp_open=
++;
dc4d137ee3b79a Niklas Cassel      2020-08-28  385  	} else if (zone->cond =
=3D=3D BLK_ZONE_COND_EMPTY) {
dc4d137ee3b79a Niklas Cassel      2020-08-28  386  		dev->nr_zones_imp_open=
++;
dc4d137ee3b79a Niklas Cassel      2020-08-28  387  	}
16c731fed6d8e5 Damien Le Moal     2020-01-09  388  	if (zone->cond !=3D BLK=
_ZONE_COND_EXP_OPEN)
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  389  		zone->cond =3D BL=
K_ZONE_COND_IMP_OPEN;
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  390  =

e1777d099728a7 Damien Le Moal     2020-11-06  391  	/*
e1777d099728a7 Damien Le Moal     2020-11-06  392  	 * Memory backing alloc=
ation may sleep: release the zone_lock spinlock
e1777d099728a7 Damien Le Moal     2020-11-06  393  	 * to avoid scheduling =
in atomic context. Zone operation atomicity is
e1777d099728a7 Damien Le Moal     2020-11-06  394  	 * still guaranteed thr=
ough the zone_locks bitmap.
e1777d099728a7 Damien Le Moal     2020-11-06  395  	 */
e1777d099728a7 Damien Le Moal     2020-11-06  396  	if (dev->memory_backed)
e1777d099728a7 Damien Le Moal     2020-11-06  397  		spin_unlock_irq(&dev->=
zone_lock);
9dd44c7e998e66 Damien Le Moal     2020-04-23  398  	ret =3D null_process_cm=
d(cmd, REQ_OP_WRITE, sector, nr_sectors);
e1777d099728a7 Damien Le Moal     2020-11-06  399  	if (dev->memory_backed)
e1777d099728a7 Damien Le Moal     2020-11-06  400  		spin_lock_irq(&dev->zo=
ne_lock);
e1777d099728a7 Damien Le Moal     2020-11-06  401  =

9dd44c7e998e66 Damien Le Moal     2020-04-23 @402  	if (ret !=3D BLK_STS_OK)
aa1c09cb65e2ed Damien Le Moal     2020-10-29  403  		goto unlock;
9dd44c7e998e66 Damien Le Moal     2020-04-23  404  =

b228ba1cb95afb Jens Axboe         2018-09-12  405  	zone->wp +=3D nr_sector=
s;
dc4d137ee3b79a Niklas Cassel      2020-08-28  406  	if (zone->wp =3D=3D zon=
e->start + zone->capacity) {
dc4d137ee3b79a Niklas Cassel      2020-08-28  407  		if (zone->cond =3D=3D =
BLK_ZONE_COND_EXP_OPEN)
dc4d137ee3b79a Niklas Cassel      2020-08-28  408  			dev->nr_zones_exp_ope=
n--;
dc4d137ee3b79a Niklas Cassel      2020-08-28  409  		else if (zone->cond =
=3D=3D BLK_ZONE_COND_IMP_OPEN)
dc4d137ee3b79a Niklas Cassel      2020-08-28  410  			dev->nr_zones_imp_ope=
n--;
ca4b2a011948fa Matias Bj=C3=B8rling    2018-07-06  411  		zone->cond =3D BL=
K_ZONE_COND_FULL;
dc4d137ee3b79a Niklas Cassel      2020-08-28  412  	}
aa1c09cb65e2ed Damien Le Moal     2020-10-29  413  	ret =3D BLK_STS_OK;
aa1c09cb65e2ed Damien Le Moal     2020-10-29  414  =

aa1c09cb65e2ed Damien Le Moal     2020-10-29  415  unlock:
aa1c09cb65e2ed Damien Le Moal     2020-10-29  416  	null_unlock_zone(dev, z=
no);
aa1c09cb65e2ed Damien Le Moal     2020-10-29  417  =

aa1c09cb65e2ed Damien Le Moal     2020-10-29  418  	return ret;
dc4d137ee3b79a Niklas Cassel      2020-08-28  419  }
dc4d137ee3b79a Niklas Cassel      2020-08-28  420  =


:::::: The code at line 402 was first introduced by commit
:::::: 9dd44c7e998e66f749348d07a700034f513ea9ff null_blk: Fix zoned command=
 handling

:::::: TO: Damien Le Moal <damien.lemoal@wdc.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0055337488022911137==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICDViqV8AAy5jb25maWcAjDxbc9s2s+/9FZx05kz7kFaWHcWeM34ASVBERRIMAcqyXziqrTSe
OpaPJLfNvz+74A2glrb68H3R7uK2WOyd/vmnnz32eth+Xx8e79dPTz+8vzbPm936sHnwvj4+bf7X
C6WXSe3xUOjfgDh5fH797/f9N+/Tb2eT3yYfd/dTb7HZPW+evGD7/PXxr1cY/Lh9/unnnwKZRWJe
BUG15IUSMqs0X+nrD/tvFx+fcJqPf93fe7/Mg+BX7+q3898mH6whQlWAuP7Rgub9NNdXk/PJpEUk
YQefnl9MzH/dPAnL5h16Yk0fM1UxlVZzqWW/iIUQWSIy3qNE8aW6kcUCIHC0n725YdOTt98cXl/6
w/qFXPCsgrOqNLdGZ0JXPFtWrIAdi1To6/MpzNKuK9NcJBz4o7T3uPeetwecuDuiDFjSnuLDBwpc
sdI+iF8K4ItiibboY7bk1YIXGU+q+Z2wtmdjfMBMaVRylzIas7obG4Gb6s5pLU4cc7CB4Shc3R41
xK/u3sLCToglQx6xMtHmfixOteBYKp2xlF9/+OV5+7z59UM/rbpVS5EH5JK5VGJVpV9KXnJi0Rum
g7gyWPuYpeKJ8MkJWQmvj5jJsJoVMJuhgD2BRCStiILIevvXP/c/9ofN915EU3ZbD1Q5KxRHybae
Gc94IQIj7iqWNzRGZH/wQKM0Ou8jlCkTA5gSqQuIZBHwsNJxwVkosnmPfW8/IffLeaQMzzbPD972
6+CIw0EBvJAFX/JMq5Yn+vH7Zren2KJFsIB3y+HUul8/k1V8h+8zNYftbgSAOawhQxEQ91KPEmHi
XLCBkvcbi3lcFVzBJlJ4zy5Nc9SjnVvyVnCe5hoWyCh5a9FLmZSZZsWtvakG+cawQMKoln9BXv6u
1/u/vQNsx1vD1vaH9WHvre/vt6/Ph8fnvwYchQEVC8wczmX7KoQVZMCVQrwex1TLc3vDmqmF0kwr
astKOGdTonvKoVDMT3hI8vaEU5nTF0HpKUp0stsKcPba8LPiK5ARirWqJraHD0B4SDNHI8sE6ghU
hpyC64IFvNtec2L3JN37XNT/sF7sopMGGdjgGF4viGoPSiSanQi0hoj09XTSi5HI9AJsUcQHNGfn
wwerghhUg3m2rcCp+2+bh9enzc77ulkfXnebvQE3xyCwnS2fF7LMlX0nKU+DOfkA/WTRDCBuq0bU
m+vPGzFRVCQmiFTlsyy8EaGOHZnQ9gByI81auQgp+W6wRWjb4QYYwXO944W9XoMJ+VIElGJo8CD9
7gtsN8GL6Ajo58cwo5gtPS6DRYdi2toq2lLQ8vC0HcOnVZUpkh1gE4sBrhUrEQLCmprr+nd/+pgH
i1yC9KFq1bKgWFBLHDpPZr/2eLCmcJEhBz0YMO3eV3uhPGG3luYCKQJmG2+isATC/GYpzKZkCdbP
8jSKsHXFeikJaxeIZAggR/0gwLk+kD1GDpZI7i7GJrlTmjqsLyUag0Y/9GwOKpmD3RJ3HG27kRpZ
pCyjRW5AreAfluSAA6OTgStZivBsZjHZCGC3/KiOHQxLwQgIFCdrtTnXKajIqvebnKs/AkcxvOrE
2m/t6NVG24IajTf8XWWpsB1068HwJALGFtbEPgNHKCqdxUuIngY/4RUMmFWDgzRfBbG9Qi6d84l5
xpLIElFzBhtg3CYbwIQVXwhZlYVjz1m4FLDnhmcWN0Dp+qwohM35BZLcpuoYUjkM76CGH/jatFhy
RxasW+q1OYDh1SaS0UoWdsTDkHzRhokowlXnN7a3iEAQoGqZwnLGGBpL1AS/+Wb3dbv7vn6+33j8
n80zeA8MbFSA/gP4bb2zQE5uNCi1RGfpTlymnXCZ1mvU3lstnk64yTTEqgtKIybMd9RgUvojZHC3
xZy3LpYlXohDe5QIBcoXHo1M3SltfMyKEOw/fVUqLqMIIuOcwUKGKQw0ObWfW6V5auwNBvwiEkAp
XKcdfJhIQFg/J8YbL8lYCyfAcMP8brESrio+jlKcV90C4xsO7r3NHs2CRe2VwUS5LCwcuj5gco4R
EDwIiSCI36zIPZ9rdGurBG4bXt20cZqMW+cdfrxsrDwMeOIqtkL7BsAc0UBY6evbHDYXf56dXdFu
ikX2B22pBjNNJ2enkZ1TVmNINHtjz9PZ+UkrzWgDeET2PgfSFe1VDqb6PPl0GtnsNLLPp5Fdnkb2
/jGR7GxyGtlJMgEXeRrZSaLz+dNJs02uTp2tOJGOdl2P6E5c9uy0ZWenHPaimk5OvImT3szn6Ulv
5vP5aWSfTpPg094ziPBJZJcnkp32Vi9Peaurkw5wfnHiHZx0o+czZ2fGLKSb79vdDw+8h/Vfm+/g
PHjbF8zV294J2lkZRYrr68l/k4mbTze5OzBAq+pOZlyC3S6uzy4sT08Wt2jeCjP40h3cotHjB+wg
VX8+9YVl7kxSMwJ/D0ZVPEMbN0DW2cIT0EfuSY3nCQ90u6lUhtzyO8ssYCYwBFub125u70Qgh/AQ
1cWCcox6/OXCpweezRZ0nrcnmV0MSRqHZPwO6/zc+v7bxrsfVGJ6IcFjVTeF0NwHJ4QytT2FjiEk
njsZjBoL8kGn0YjFzer5bnu/2e+3ThLHkttEaA1ODM9CwbKhaffRYzcYyu0DKQEanjrZLWI9sw9/
u949ePvXl5ft7tBvQcmkRF8Rlpk7RR+YPSiVlmkVJAsHjD4IMa7bgbtSn3o2ycX7p+3930eX1E+e
w2roH3+5Pm/+szeEqap87m6yhoEXOGfBrb2PtxdtU7petNv83+vm+f6Ht79fP9VZ3DeRzg3hVsfy
qtTot9Fm9jBl1j11I2xwvYvt95f1M5zFC749vji5wSHK4NjDwyMeHVx69fqy2cVeuPnnEYKpcPf4
jxOnxRzUmM+Zdt5wCdxWN0IHMXng96fvMpeWi27HkccPJL6rziaTQfFhOuLsAOp8MoqCeSbEI4rv
rgFj3WnB4JhhmVLZ0Dy+VRBbJaN6fl4q1mVvayb87qn4Y7r98/Gp5YQnh5YHVoTgqwurBcazu9eX
A4rsYbd9wiRvb666veKYVk3XYTR5MSdsZBBpDzXHlrCWd7yQhMmcWtwwWTOIORc2yaXDMAjTwQQd
z2Apk+1Azfuve4cZLaEFrhXv9l844rGx8H4xeTORwtos+dWy/06gnqfHLO1RtU7siG++VLm84UXF
Iwi+BSYfGtN75IjgwxcPT5uhIsGK2agiqQd0Kv7EkznF+vXu/tvjYXOPF/vxYfMCc5FeEFxEFVnp
GZMVknX6wCnpLQDmcyo/XVfBa/SwNl5wTSKcDGFf2zWpglhKywJ1BZM0N0xryqlE3RSRmPzDM5X5
wAkyThdKXqUHCxd8riqWhXWyAutwphx3lG+MbyofVq7z7ANcKlbgQvVoZWYdbOGGgZyIPKjq4m/b
5UCwQfEAE1dvoCq4Hu1keIdDxgjrejgeFS5Gg2Mo7VmG8D475WDgZyHJ5FLNDhm2rikPMD9l5Uhl
WCZcmdwfJoMx09ljJbZyiLkqYWAWHsHZoBLfZPfqu8W8rpvxyaT1QKPIqeDBTVtZw65oPg/k8uOf
6/3mwfu7Vo4vu+3Xx6ErgGRNuwXBA3N07K4xZM1bqtrMbZtue2ulYU7undfclT/Ay8esuP3cTD5Z
YZa17wpqLsEpGBpQE/aMppMbqjJ7i6IRbDpX0MygiqBr50mSNykFnXFq0CgCBTzYt2gwmXoDb1Qp
tJxdZa4SKWYZR8pxGUgoCN1t6suEJtGgelu6BebuCVFoxV0XHNkqF7Zi8pvqb/dzUalACXgTX0qu
tIvBapuv5iQwET5VmtN8DsENWbVrUJU+mxyjMeINnSoDOt1piG1itfKi0tJIdOPr4TgAVekXkoH1
elgOiGgOG44Ad2XOaBlBgrp9DVyLoLjNUT8c2eB8vTsYX9XT4IM6KYBCCxPWsHCJZTzn1CyQRdbT
UA9drHq8pa1URIFZChrMQfRLgYMp6KV6YWbBm5tJVSgVtS52mYRCLRLm25F/KjLYvip9YgiEe7Ah
Va0uZ9SMJYy8YQWnpk3ClBqC4LZ43huV+XuHBpeqsJlMV07KkWvqnRdWpOxN7vFI0FeD3W+zy3fm
tx4HRdU6cgM5tF9O+qVaChgs3edonNQ6SpB9C4glwjBOyLq0H4Jb5HZyWsjFre92TLQIP6IDWne9
ToZVdubIQf34FMQkxirY+qxv0zAH4P9t7l8P6z8hHsF2W88U9w5OhOOLLEq18QuiMBdUv1lDooJC
5MNEF5rcBo/5NEcT9eDxScFCWJ4KlqkxMLSN9tgZ7Jxj+kbOkU7Fdbtss4Apy0pGeRZ9qq8msV5s
iyFA6Lxp2wlTeQIOU66NGwSekrq+Mv85ib2Co3V0Kt+ZTNPS9HgIiIqN/eMrdJevzzoSDjIFUYlx
wBZOiBUknNXZRuJkd7mU1nHu/NJy/+7OI/AAnXCNFyYLPOyO6z00bOABmxCnjKz9dgKTa167qcxx
z8Yvsz9p1yqYbQ7/bnd/g+tGxe3gayw42bcBatRVqiDXDssMLBSMdoH0iGOyiorU9BORWGwfWvBb
emSYm54mTvYcivrIvQrJ616TgLm93DZBa1irQoJnSvkNQJRndgO5+V2FcZAPFkMwJhnyscWQoGAF
jcdzi1y8hZyjSeNpuSK2WVNUuswy99Gq2wx0hVwITt9GPXCpxSg2kuVbuH5ZegG8lorF4zhwd8eR
EJBKMvtlsN1xbSAK5ACkg7wFu9OXYT4uwIaiYDfvUCAW7gVjTlpscXX457yTNqrroaUJSt/WhW3X
bIu//nD/+ufj/Qd39jT8NAhEOqlbzlwxXc4aWcfGnGhEVIGobg5T8HyqcCSYwtPP3rra2Zt3OyMu
191DKnK6qmewA5m1UUroo1MDrJoVFO8NOgNnMQATEnIs3B2NriXtja2ipskx/4MlsJGXYAgN98fx
is9nVXLz3nqGDKwH/d1Dfc158vZEaQ6yM/a08RMbzNIMDdQRTR7fmuQGGLs0H7T02MR1poeOk/I3
kKBewmBknwI7eEcUbhGOxMVjH4uAc0PCk+nICn4hwjnlLdQ5RFQNyunpaUDkZMuEZdXlZHpGB6Mh
DzJOm7EkCehCNIRtCX13qyldVE9YPlIPjeXY8rNE3uSMDjwE5xzP9IluQ0B+jHdghwFV1Q0zzF5C
BLgE3/27dRlwfcxEyuRkMufZkqoXtewn/Ap7n6ZwMGoH0nzE+NXN0PSSsRr3gOqdhpw+DFIk5+Bk
K9TjY1RfCj2+QBYo2uI37eJIkxdCvkcTJEwpQWlVYzxXlV+q28ptevW/HDWJgvHkLCWyN7YD6x02
+8Mg1Wn2udBzTgugeXGFBAspISyQA340zvTR9AOE7Thb18fSgoVjHBp5ED79hlgErCrG9FJULYKU
4PCNKCBgU25HaTTHB3d2xMMO8bzZPOy9w9b7cwPnxGDxAQNFD2yJIbC/T6shGMdgMBKbhpO6baRf
8UYAlNbA0UIkVJyIt3Jl+dT17z7D4FzfVU5VEzs+C9qHCXgeV2Nf8WXRyOeCCkzYsPBl+8kRjaOs
bKuulK57NayKUCFhe3Vrdh9bM5HIJRmBcB1riD5bLdRGdUfl8v4YQcBcR6evvT3eH9d9+3iurjnE
PMnJnYCm0WkeORtvYfDCyoyWbhCfLGTJ6DdxZtFIFKlJ2pkvZttDRo+77/+udxvvabt+2Ox62Yxu
TBnALh11IJMgCPH7ph7JV7pg3SLWdx/9KPOJS31252YoArivJBlp3OkHtNl/O3IfnqiL+E0VAPPb
Tman4zLmocNCLEe8pIaAL4sR57MmwO+am2nAiqYgcdSVpNUXqapFid9K6zrV37tPOAODqDJo5zEV
VGKaenxLxNuZWuXA507/dP27EtPgCJamdt6xJbQ/Tm1h506n/ojAd3X7B/OCnBegBCoA5ADYLdrU
x+IYZ1X920ktVSRBNwRHxqfVBpkiKzPaSSjBT8M/dfSq+6zty3q3H2gCHMaKzybxO7KKkxy2vxYB
lIw6qDMlyKfppjialsglt7sy2yrhn166xaxt/bmE3q2f90+mB8pL1j/c3DGs5CcLkOmjDZjS1Mh5
DA5iXEsx2F8yZfUvyxbopCpuyAyDM7CIQncmpaLQzlqmLtowUOYDlubm+7fhebrEvOl0VJrwgQqW
/l7I9Pfoab3/5t1/e3zxHo5Vv7nQiIqLEfMHhzDCPFd3U+A9VS14OBV61CYZIMmv/5AKn57PwD82
31lWZ+7kA+z0TeyFi8X1xRkBmxKwTIM3tNLHGJaCFT56TogBy8TGngWgSy0GFwq3MAC4H9SYB+cr
PrSE7ce+45dY5+jXLy/obTZA45cZqvU9tlG6bwOtCxy47bkaClp8q2oF60paDW56E0bO3hLJaGw4
VscZcIfS+zbdnGMdb2yWeS4kyFdI+RpIVwagmcrV4GAJ0/U19Nnwd9hWd8Btnr5+xBa29eMzuLww
VaOrrXdkLaOSdhFn4wAcewU6HEoH/K601Niih07zxeRqNsDywvQ/IPZsekkouWmqjz258HH/90f5
/BHbKUfbJnGKUAbzcyvwCmK0RmDAU6tbvIfq64ueqe/zq47NwLdzF0XI4CtKowszjpghSxtw/anY
bd3vPMLhlrT/Ep+caZCBJyimK1R386PHbJA8CCD8xvAudapLIwSg94OhjripqJPag303DVFr+PW/
v4O1XD89bZ4MW72vtZro2i73BKOx7zoJXJvWIdOVoKqUHR4fIHFCfGL46TCBCsCxzQLe+ufp4/6e
2BT+T/33Ro73hEV5mQWxW+qoa7BBANL3F8jbcWu4zUGn5kmM6eJ3lE0zc5Kjlvmf+v+nXg7x9Pe6
hEY+fkPmnv4LuAPSspLNEu9P7Cg0X7izAqC6SUzToIqxiDjQEYbA537zp4qmE5ehiI3AXwBlOqZC
gWKelNw/UsJm5qEf5VDEtxDpDHzdBu1aBvAT0dcf+aNJgF1I/w+rASUySr8OjHqY49HD70E5DyAY
ICfslljD1EtT/Lqz+XDYNKO4H26OAYDYqd12UAgXIzq9Y9GYL1BHskAtGVtdXn6+oksZLQ2o/wvi
YE3Tk9t2gVFiViYJ/rA6AsKBMwJTi5BSpu0cCfinxzMjFNtvmr83cznEm0Ym2YztM1sNNix8Op3b
bdwn/6ZBg3V0sgVsNnM2o3C9de2DLmQGZgaDcEnvB79PRoHC/AqdEjbpKFzozfMMzlsbxWXKsdPd
VWEIbQ1jH38gsK4eMXcjNkF8k9rtSgYWMR+soBpANSvmXJNAEAilQNWUNHZ4ozbuqFDUalj7oJ1F
sCLrNjjimZKFAjWmzpPlZGr/OYPw0/TTqgpz+689WcAmJdAnMso0vUVlQYVsgbo6n6qLiRUzgLlK
pCoLcLN4sRSB3X3K8lBdXU6mzP47CUIl06vJxPlbRzVsSn2z0R5NA8mnT87nIS3Kj8/GPopsScxO
riZUaT9Og9n5JyviCdXZ7NL5w2xq4Jb2hR78yn5VqTDilCOQL3OWuZ5UMEV1dGyaOZi+9Ngs13B4
TFMrdGuA1kdQLiJlq9nl50/EhhqCq/NgNSMGQoxYXV7FOVcUoxoizs8mkwvHR3A3X38EtvlvvffE
8/6we/1u/nzD/tt6B47uAVMSSOc9/T9nV9LsuI2k7/Mr6uiOaI9FUtwOPkAgJbEetyIgie9dFM+u
1+GKKdsVrnK3598PEuCCJUE55lCL8kvsIJAJZCZAqPgo5vOnL/BfXc/moDuiX8T/I1/sIzEPwgjc
jhJQV3tNIS3puTPUIP3TUzoP3PJMUrvrbAfGvE2nfYoDqYT6yrkeQwW4jKkGqSAGlWUVu5Y3FSQ9
qt59J9r5P/989+31y9s/39HiezEO/zBs6qZVlGGbAj0PCkSMjZkZYGnmxIwgFpCenZYsqwP+dQKL
1I1I67kblCx1dzr5rr4lA6NwNwmnpnif8XlyfLXGh/XVMiJmlkeqAH+hlfzbYTKyhyCb7oBLel0d
xD9OuQBBOEZwedlo8NBj1Zt1S6vN/2V25k0G0TDXX0CsXcjA5IGkDBdkNaXvidOGqsG0eAW9VP29
7PsgcVMBxOCYnnI08gmVYe7MEFxAcy+2FCvuuoh9tMteIIVbEF00HU0XaXBhHrU4Uju7LY9wKpZZ
v14AMPiLVFgQTwB7e8EAsQJuSqYCcTsBNbwOwyyJlFyFTrPCjNl1P3Rt4fsMpdiAInCNerpYN2br
zvPhQmohX/qv0nnp2XwbQsGqA29x74Wuow+Bg48rvlIdyFBeCvyDPHnsV0T9WInfhIp2wbLXeS5D
+QWvoKDfr3Jkho6JFQRPfX0gcfssTdq6Qdwnik9iq/30058QKJn959O3n395RzR/JOOUfHZe/ptJ
lo2Wn8GZipuz71q2RTeIvZlQOLSiZxxuyIshumuQmFotrwgODhSnX4ZuwJOsZzMYdq0uDQ5JO2pj
kVTHtku78Q+q9X2rc8blC5zyGGKcpNzbnoGFOBHFwNVv+TCnU9edarxh5wu5lRUKVZnQIUYcgssC
FGnIIPYe8zjt2hToeqcnE2lI241GunpkN7lI4Z9fPR6xeyc914oO5kb4xLIsDkRan12FlrKbut+D
srLB+60l3I+V4FrZNfhgtHiiLMoNvWjrPITxFj2z1LLrhZwMoczQsmC5hijBenlD83CGDWIS2tLO
2T4aQJKB1diAVoSRhl0M9wQNK8sPOACeTceaDHj/soYZyhpraB7gxjcS8mLMAbG6ULiRHPFlj3E5
iXDsue16IYuh4NWz4N2qF+vET1HutzjwBFJYGCI0moKWudKD9cwnzZiMYpnzmdFOPHUt9ngfT39+
9pkZwaqBxHxV1/aUuddP6/W5i2ol1h4vgb73COQ1ctZ+/v3rt++/fvr49u7CDovOBlxvbx8nkzBA
ZuM48vH1y7e3P1w18lYTbXuDX8tWVTS8fPJgZkBe8dMb4MBM1ujrtg4dho4UtGtwlAoRs8Mhay+w
oYFVxgoMug963K4nXHcRDCyLinh7Blm5dXggkxEYhpVwUOADWYUDunat07mH/+W5IAyHpEBTtu0S
dqSUBobvbp/ARvA7157yH2CI+PXt7d23X2YuxKrh5pGHlV7AKlz8lv4piFmdpnUUmK9lezU2D/Hz
3luHwFNglC9/fvOerlRtf9E6Vv4UAnHBbNrxCA53tXEbohCwmjXO/hVZOc49GdZTCmkIuKNOyGJw
8xmCDn2CKC7/ejUOZadEHbiIu8XMdLCK1O/gLZQJCaVs7+OPwS7cb/M8/5gmmcnyvntGii6vKFEp
1lrf+66+VYKn8vnQkcG4h51pYm3Cl3ONoY/jDA/ZaDHlyCRaWfjTAa/CBx7sPMGDDB7PybHGEwae
IIQLTzHZrw+JJ5zewlk/PXkucBYWuDV+zCGnr8e0f2HklCT7AJcEdaZsHzwYCjX3H7StySJPfEWD
J3rAI5apNIrxOJ0rE8WP5laGfgg8ATUXnra8cZ/T+MwDrg2gZDwobpJHHzDx7kZuBD8oWbku7cNJ
IuTDHtd7FpbqA0vCB0PWicUMdx5Zp0cT3nl3oWef2+jKeav3u+jBpzLyh22jpBfS84OaHyi+La3j
z8GBHlV2tPVzXQblT7EahwjpTmrD0nChH54LjFx3p0r82/cYKMR30nPjahEBhRZxuKAs9Lk3L/dX
CCIo2SGKVrSsQXzQD1JcbCl2FbPXupUgylX4yq5VQk4W9B2flekIbzr5KoM2nZXD7KVt0Enf16Us
c6NeYrbEeYpZACicPpOe2CVCn9jXoyYCf7x5Lkxoc65sHEfilDmZDFnlrbPCKtDLB7qFb+ILqQAc
TzVBdqbcSUvE3MWAqMCouoWuRjVOqBc67Q4DfoK+sJyOIWZ4vOKDLrgb5HuDIpdKbJONfvm9YFL9
IBSDWFWUt6o1HCAWkDcFRRtYyQBKW/W/wQsBHZZpQ07yjAurDMQr6oaDDzoYbwmsGIRvMJ0t1ibc
quK9x596YXo5l+35glnwLizFIcc6nTQl7bCm8MtwAMvA44jNGxbvggABQIy1PDYWbOw97tMLRz8O
2Ee64EdWkcSIYKs+E+lqjK1iEwxLjhK91yprRLjFhSc7Kv1aRcdJkWZpvoXZi4/JgTXK4BiEzhBs
5gHq/r0Z8RNog/MiBM5qpBWu6umsh0sY7AIsur3DFXpaD+p515b3irZZFGS+6tPnjPKGBHvsdMpl
PAV6uCsT55z17l2dy4Kv9y7j3rLQxTgMEwSdoYBVXD/708EzaXp2rnyZl6V+rmAgJ1KTcQtbt1iM
ZaTRbufpwOPlfcXZBQdPXVdUo69jz2KlLbHzHp2pqisxXTyVZwl7TpPAV8Dp0r5ga7LRuCd+DIMw
9eVR1mhQZpPFM2A3Qrvmfst2utWUy+CdDUIbCoLMl1ioQbF3WJqGBcHe1yjx7R8JgygQuAZg8DoC
FjZKzZhc6jtnnpZUbTma0o1RxJPvNQVjUS1bxxMSG42C3488HncJXhX5/8F8rsTBb1XrqywHt5co
ikdo7YO6qHXTM/YFz9Jx3Fqkb0Jj9lw06GxC4JNeJx3DLfyd1lU8DCJP6xmVa4FnRgs43O3GjSVO
cey3wHQTvFe+wofmzj0bKqtqIzasiTH/J8Z4EEahD2uOpouehfaPepuNWRL7+qJnSbxLvavjS8mT
0HOmYvD5JE9j4+nq6jBU9+sx9iwYQ3dupq058lWp+sBij3Ju1EgGCsPuwCbt2wi3pmhC6gn2zlmo
otqfyIRJCYYKpcezPim2g5AS9DZPR57RuBOt5dx433U66h3TVIzMvWufyme3XIXnkdiOQd/yt5KM
WR7GSzYumKdTHg7akGzvVlqe/R3ElqmrJhpUCMm78GBXMfwE68RKeivzEl9/l/NeoW20E6e3xU8j
f5+7ZciI2Q3xheaRPM+lvHzZ4KBN4Hm/R+FgaVTDw1nIuDis/HLvb4Maf7+UDx9oGGQrqzM9xz4U
i2FfPrmtnk7E/k45E+c8RAZ4QW87enrM4nSP9PWtmWaItzhgQYuS82To4PVcMN6cppJVQEHyXTxN
am8RwJRE+MxXe9od6cxirCNsCZBkcwVXkFiOwiR32kEbYoqrBhlfTIrhGiZiKNXcwWPgLXxJPPPZ
ZSg49cGMw6lkYHfM0FS20iBJpsc+UFhzsCjHXeRS7B1c0sNiMoO2+XW9e6KENiUyrEwmmud1TQV6
3u+UYGzclKhL89c/PsrgDdUP3TvbXNdsjfwJf08+R+ttvAR6MjyhjjAKFvugOui1kg0EsxhS2GQk
jqYTxMaK/2+mHah5sjyRe7wa6n6HhUh+F6sf4KjFdLuaKfeWxbGhOy9IbQ3aZBaBdf8SEBa7jVWX
yL+8/vH6M9guOG4pXA8/fdUf3lXGj3Be3bJavl/IdM6ZYaWdby5N8K1kCONqPrMO4TNzsXBz3VJG
OU14iZMfVBhrvk61DF0HT+facc8nx+c/Pr1+dh0dlTJ9L8lQP1MjvLICslDf3DWi9hTvHBkA5wuS
ON6R+5UIUmvKqDrbEc450RcwNaa1c9E8Gqlqou9jalztcL/IgBZ7DB3gafSmXFjQgsqRl23heyRT
YySsh2CzV8jtIXNxe8gy8DDLPPZcig3CdUxW4c4kaH//7XvIRlDkbJDWPq5LiMoIqlwLLc0Z1Rlw
p7rNsPR0YHHAsz20chIqspZshzP4CjY3Jo3oTcGqo3rC1u5GBczptjqcUdqOHpurmSNIKpaOmJox
sUzL9ntOwAjd2SpcDqxmaIIpOy8G8r18YsD5HHSmA7kUg/jWfwyCONQfJ0J4/0afTTZ1Pbs/+jAI
eio+gUdWw2M+x7ocPb1mcfydulEwd4RnUIrqVAllFH/fVvHCgvMSRPGPmgOWtdLaKSgfauf+bAJb
5WRU+NwQ2vuJecycwBFYbGS4wqset7WUlnnLus4xnJAKybcbPDGQ5DvaqPDe94blzmTQj6zdlZAx
7+oVbzzqcnOYTCfVLdiRUHOzXR4ztknqBe2qU8HGV7O9BT+QfRRg3bFw2KHuV4SKMdS38BUZq/5c
6uqKqL1VBUF5EiSkaBlkeB6JiQax9iQd4h/Bfj8PKRV/ek/bBIDPA0hUYRrDhMh7YMu6UofEh1S1
pS4l6Gh7uXbcBq+iMnDHND67iRiPopde9xm1EVOvEKtG/Tzf+89PUTly3dqdqjOGC+PSMWwJFaeM
x0KK2OsZmptokzTSgKAPxrQVgDd0jgTlI9pXM6tG2s8p9+g/P3/79OXz21+i2lAPGcIFq4xY/g5K
zhZZ1nXZnkq7IiJbvy3WyoAHDJ/xmtN9pJ9Cz0BPSR7vAx/wF1abvmphkdsobihPdkIZ0hxL6mTf
1CPta2uBnJ1ftzpWr8UUwA/EZbNtlhWEHIP61Bmvoc5E0Qf6bFoUE4gAt47mOtvUG4M/QXy4KUbR
d7/+/vXb5/999/brT28fweD6h4nreyGpQfAiw01WTi1RPWe8jX5k1amVMRRNacgChT5z9aNu7Bdg
KJvyGpokeyObaXcVsLxq3/uD3gHvU9k4Y6nBnWPSpoGi+z0VZVXDS+tLXoz/p4c+xJIB70IK6Acx
5mJMXifbdkdFkmXZYUOAyEnH7uV1ef6k+/aLmndTjtpI28N4tAPvzgqsbx6ZyRm/oIYzAE0Da/ID
cXKN30onwwtCFBf384TAkV4vppUFvosHLL7AifqKvNQs0l87gbDPgjJFx9N22ZtJXsWYHo9vzITg
gW3+unX8WfoTr8u/OvsR42aGYlrJnz+Bp7/2Uii4jYudQK9Q3yPBG3k/PQerP7E6J+D9PYiz7E5t
b1zdtH7yPwEbb29Eds3G/nV9F1UW/PW/Db8Tpz6LYKeW57WPBKHRzcKBQfxPO+aZHj5cAU0Qgsmw
teJPmFCiI+uZbZsBDreN4/wZaWgfRmyHmw3PTPDkGqpJLQxjEO+sZko6b44IWV27hDusQh0t686N
rDG8/fb29fXruy+ffvv52x/IOc2cXndRm+MJetLaScUEOrfkRAasxoUhts50yvZpHcQeIPMBuXZk
ND1iA7q0ertZbg+aQSX8Nh6HmwgyphWEw5nCXsVBOHN0Ryto2ZykGj7Y3qZqmnl2TFkXK16AErcM
8W0h3a+BRV3D0OnvK/36+uWL2M1lqc5QynTpfhytmLYqEKJUpI3zUFm48ur1NaG4kf7gJDpy+GcX
YIZHeuXRMAKKYdjquHN9K6zqg0kxvVIno+aQJSzFD64UQ9m+BGHqZ2CkIXERionWHS7eoay60aqR
GF2qKyWSuAgDRtc3xf04RQexn3d3h3MR6yT17a8vYvG1NvopsqXfhWRiaD0e+3IEbnefgKT6DbwQ
UMfHFQ7tlk5UM9iaOs4HsT6y+Seqjz/dOVS487Nz4X1FwyzY6R2MdKD6jo6F27FGrw3VS9cSq4hD
ke7iMHOpQYZQRc2D5nZ1Jqu6OPR1qRJZnUR1n6URpmMtaJzE7nchF97t4YWt5BGHx4VI3ZPSmMcZ
bp2hPpE6zGyVysDBfMQZTHXjjJGzxB16Qc4De55M5NAmf2jGLHH6CnHc0GF1W2tlBUQzHNdMznP8
egmZefYHezoJBZZw9GBQjYkQ1fRHVG/BvD8E3//n0yTZN69C0bNcHIPlOQ8W7jNM5NFZgpvu57oA
5ta40tmp0j89pCp6Fdnn13/rt2Qin0lFOJeDWa6iM+ugawGgLTvsczI5Mn/iDJxaC0+kfYM1iPy5
4A5mBk+IGQTrHNku9haATk2TI/AnflTyPvJ2UIxGjNM50myHjJgEvFXKyh3miWKyBCkypaapowm/
8iF6ocmjhuoKZZe+rw0bJp3uf/heZ7ICJPYFUbirj5CCwmNB4rPQziVnMygrzWQGAtPP+KgVGWGO
dwt1PXuFFxMkFWkEaIknOI4SssLOtBGeKnmnt3AXYB/RzACDmeywpGr8HyTNNMHWoIcunR00cXmu
u0FUcV0s4pz88CFMRz0kiwXYZi82fC48TzVbfAW/X8QUED0P7tsb3S72e8Pubmm/RV+GSdpSufw2
fba5sucC0IVGf7yU9f1ELujrYXOeYFed7vZI7SYkxLpKYiEa22NuhJzsukXODEzbrAuADBOmLt0+
A1xLkJNgow41j5I4cHMsSi6PDWU79kmcuCyz2OND8givkrRlfNQteeZmK2bVPohHD2CGttGhMN4q
DjjSKEZzjX3FxVmOtBuAPEMA1hyiPTJuyqo3R9cMOS3hWiDM99g12cw38HgXIZNo4Pk+jrE+uVAW
7Ha4CefSFCXGb/Vbkee5bq48tDFPwADSXI6tHUH+vF+rwiZN55vq7EDZSrx+E4oedn67RGst0n2A
G5YZLFg7VoYG3J/W6phA7APMuIQGhAUiMDgiT3FBmqJAHu7RgLak4KJ1DyLaSh7cv93gSfAZYfCk
W5F3FUeMVpRFjwLvMiq0LGyiLxwjBFkH6/SWD/or0GsWYOmD0PnYIx1OxV+kgieoh85FC6aODx1y
kGCTRSmsWNOPQvPdxceNhgFHFh5Pbq7HNI7SmLnASbeJX4h1HGSswSohoHDH0GCbM4cQXQiSpxgU
NEN1w4SHRJiZztU5CVCZfOao4AzLXCAWiGcpVvJ7ut+eqGL9GYJwM0Y0PLRETqVbKHJAu0ByJUaH
WEGpx+nP4MqROQVXv0GMTCoAwsBX5D5ET+QNDm9992Gy2UGSA6kSiAPJLkFWRYkEOVaehBL8AE7n
QcUCjSEK0ghdByGQ9fbiITkiX+2SZL/VlZIDDykuoRw/NDVrnm+vfw3to91mEzg1vIOWhGV7DIND
Q30fUjOk4uOPkOnVJCg1jdBJ06CRwjUY2bsENcOoGfYZCL0NpeJzuMm2Zkvd5Oh4CfrmR9Pknsbn
cRhhyrjBscc+YgkgH0xPszRKkI4AYB8ivdlyqs5+Kni9DMEpF58Z0okApClSBwEIxRRd4dueNj6D
ybmexyzODV25b/B3SpYktwZ2Dbci8wEogpw5vgQKYPN7EXj0F5ofxTbwphSrC9LpZUODPfb5CCAM
PEACZwVI2Q2j+7TZQPLQhx2iHN0PGecsjTc7omkSbMUmBQ3CrMgC5BMlBUuNA/sFEI3LMAmoaol1
A6wjmxNJMERhGGBpOUWDsSzwuaEx8gnxpg/waS0R7KTPYEAaLuh7bEyBjvWHoMcBMjuuPAgDtK23
LErTyBO9XuPJAtxhZeXIA+RDkkDoA5CaSjoybxQdvmPTFEHD6zSLOSK3KihpT572J2F6xh8SNpnK
85ZAvdxDuKnl2SBmfgnLqhk1aCLN7/3i9pwTD+OEV8zjDDYzlU0pNOcWHEhARe6OR6H01uT53jD9
IeeZXW7nG9mZbz/NVHi4DeKR3PlQ9bjZ8MxalMpE7NTB0w5lf79VzBNnHElxBN2JncmAehMjCeSz
vTIODVbvv52lUdt1hunwgbQn+RcO4xWh/WXm2uyDsrkoR6SNOppWBfMNIjbJ9NPwrdJvBN6h74zF
YTVk/defv/0s3271vqR4LJyoJUAjlGdCqUEf3wRYqO26w99MC42lFdwU1SW755ZUJiM8zNKdY8Cm
s0gfbXAUoNZrngt4rikazgY4ZOiunX6qLanaHbOenXVQvNJMC2Sg26Y5K83lXc11jNpLcoTJzwuq
m/IsRFOIXcm4BiwHAk4iItzMA9LLg4rQF49sZnAaIJ10Mcl5ASOz+vbJPdBOhJdgGTefXxglCDEr
mq4ePMU0fZiEuZ3uXAnlLfBF8BPCHjy3VVFDrAeqKAe/cIdMVUhEs/au1QFQs6wX2ox/3iscD/a5
4MnOP2DyAD5OMWVngmdLN4caO7NH0bNkM7M8QjLL9i41y/XoHAsxjBFijnHmmVNBnkToycQMOvnM
6q9JBq99O2+hr8RinmLCn0xiHaRLmjLcsHManrIddqYsMXUMbubDSmo/xQrUap8mdngUBcjnz+VM
tFcYTVMy6sSenjMxUfCVgRz+j7IraW4cR9b39ysUfZiojhc9zV3UoQ8USUns4lYEJcu+KNS2qkox
tuSR5Xhd8+sfEuCCJSHX3KT8EjuQxJLL1rduCt9ew4SbqrbF8fFyPjwfHq+X8+n4+DbhDkyy3n2x
7uyXMQwPh70l1s9nJFVG0RgDmuRJJ0o0+ZHX7szDVWw4HE4NOmBd7nmxNsJ1lBcRurerSWBbvuyX
hb3qoDp/mBsXVjyjG9cl9k400B3bJBugUUwnSuvJURlKzy1EqJI+0UCV1IkEqoNTNReZHKPSE7UD
6z1d6MujR6J1oriJussDy7s5z+9y25m6SKZ54fquttLb2PXDGXZ4ZWivJiXmo18hs82Fqi0nEA3b
CNEsi1W98JVDbU9F5xoHdcnLaJrgpVQPVWLsQEmxa6TpVR/0vTQayjubKa3kroVAX1DdyvWIrF8o
p1GRzomGSuRK43IHxMnM9ZTvsGjUZNpk9zkPPmXEnEdHMyb1mZFjkW3BUL3KW+ltYmQAe8g1t48l
60J8ZB154HDDzjY3ueiuY8nXNFJTOBSEAb5lEbgS351hH0GBpT8+YMlNFgUCi7JHHxFhq49kjbxd
41wwXX6Gy+DFSuTqDhkf8BnVWmUWcS8tIY5tGSYXYJgQFWZXVPquL+/sFTREdZRGJlmtcaRnJJ+5
lm+AAmdqRxiGSEoBpJ/zqW1EHLwZTEEGk9Yyi4vOKvZRRFuhfS4FiH8hTFAwDTAINvV+aIKUDb2K
+YZJAFvqwMPdXilc6BZb5pH29grkoF3BIN8wMgycYntvhWdmLlb+aqndMsM3fwpb6OBKqAJbXNu0
j2/LpqL2PRsfvzoMfXQ+ABKgM6+ov0xnhiGnZx4bXQeAOKikAMQPTQjewWBG4JlmVr1YP6Sm6E8C
24ZKEEMIDIXrA0nDeGZoh9R3BV7JJiL1PG2a+zpTnBe3WYm7ZRAS6xr6Os9wssMyaL3QwrVsRCY4
Yt4upC02+EwgTlFHFjoVACL4LCF+EU4DdMhJvoSQXoYx73ZOH7SI0EOnFRjcd4lcoaPurXCuKa5S
MnLRE4Nv05l/sxexY5mMOvg1g8zkK+4tVXR6+1ODHdsU1P6JhnRnMlMWVKZ8nIV0VNMwB8VULVRh
Iyo//IyA/vIiYwYjGYlJMwvpmeIbMRwhlNcuTmOmh64ETpd4Olza/YsARNVtDYGqesZ50myY4wKS
5mmsm5IWh6fjvj8mQPht8Sae1zQqWCDxoTISyoMr7NqNiQH84rT0IGDmaCIIemcASdKYoN4O0YQz
JXqxDwczPa3JQlc8ni8HzLR6kyUpC813a1C5uh/unybZzMd3DakqUpFdgNpvx+v+edJu+qhn46hA
PlJgWSCA55coiWqIPfeHHYgQeF6Hy/YiKysxaDfDmB8NQidGVpV0kwsBeMVQGcCzztMhQrUQDler
oDiddDXYjZePA8b91uAvflDkTzHCzLjFKOTHZkLHIjeOjmq7QSaHaLbJSfvT4/H5eX/5gbxY8ZXQ
tpEU+oVPwnU5epGJ39+u55fjfw7Qb9f3E5IL4+8uVfWFz9E2iWzmmM08EwfG0JmhNyUql3LPp5U2
xU5sCtsslNUgJTiN/GnwYSaMa4p2It0QOvKTmYKJ+kka5hoxJwiMmC3bYIkohFnD77IEpm3sWNI1
j4T5yoZGRj0Lv+MSa7jNaR4+MWXC8SnuMk1ijD2PhJbhSlpkjLaObbhv0ScNqswusi1iy7KNXcxQ
9CFPZTKMblcLxzC+YdiQgPay/uXgqdfRTApwIK9Qx/YNEzVrZ7ZrmKhN6FjIF30YL9eyG0xfRJp6
hZ3YtNmeoWEMn1vcWf3o+woRPqJUejtMqEScLC7n05UmGbyVsAvFt+v+9LS/PE0+ve2vh+fn4/Xw
6+SrwCrIVNLOLbozkgUtJdJdrqUSN3TL+TdCtHXOwLYRVkq1ZSJMelFMMFoYJsTlGnBYox6ZX5T/
nVwPl8sBAr3vn43NS5qt5BWbfWA6GRk7CfZMy+qawcJRExZlGHpTbI6P6FBpSvqN/MwIxFvHs+X7
t4GMGq2ywlpXXClAesjpkLkBRpypmRN/ZXuoJns/qE4YaonorMDF3JBoppfE54Jx98BnlSlT+NpZ
8jNpP4IW/qrVp3JkW0u2fUiJvZ2ZerSXBoltqTOfQ3ycXAViRW1V/khfPjx5gA4z+tA2TgJtbsD0
RBUfWemEfsaUwul60loFfjsiO9DaQ2s+tcVZ3E4+/cxSIzXdUaiSAGhbrSOcqYXNd0o2LS42YV1l
xtPFnciUPPAkc9exSZ5Si3LbBnqXtK6PrCrXV0Y9yebQn6IbdJEcq22jwBQAQ+M6uEaSzcwLrmtX
KNchWswsdZKmMSrM3WCqD0Li0G+e8UQEsGdL/rkouWlzJ3S1EeVkXG9gELLYpoP1e2LTryuceapE
nIxxJ/+N0xBWeagvGd5bqF63AGuShks1aXmyqkQQdedTSc+A3yfRy+FyfNyffv9Mj4b706QdF8vv
MftW0WOLsb50IkIsG7lHq8bvlHkVoq2ugXlcuL76Ac6XSeu6aqYd1UepQaSSIeiwMmlgEVqaiI/W
oe84O9rIW4vXHmRKRpLbQkUegZkhhm63QkLzCmESzrGIVLD8Tf7Hf1mbNgYtt5tbAM8dXBH2B28h
78n59Pyj29H9Xue5PBlqMY7i+OmhzaRCGf0qMYjdBHIFmzTundj1XlMnX88XvhvRtkbubHv/pzLu
5XzlqFMEaDONVjs2QlPmJ7zTeeqcY0Q1NScqoguOxK46M0m4zLVZTInqRjJq53Qv6ar9lkRB4Cub
02xLj+j+Rp3a7NThmGcYSFtXqd+qatbEjbRVQuKqdTDtEZYozdNyUJOKzy8v55Ogy/QpLX3Lcexf
BQ+F+tVGL6ItbT9fO8jhQjtDsLLb8/n5DTwK0ulzeD6/Tk6H/zOvh2RdFPe7hXJ5Kl3P6HcxLJPl
Zf/6HfS2FHeqUVMIcRyGvEQyoy8u+5fD5K/3r19pVyRCgq52izlaJzQZSzffP/7r+fjt+5UKhTxO
1FATQy9TbBfnESGd/2pxoAHDXPR3MPgZySHmmzGDkeNzmzg+tlkdWXTNohGr73BH0SNH9+D6AdcX
FjvQFOd95NODxGksUQLvlJK7CwmaohBtZOBaEd5KBmJW8QJLHfrye43QSeBHusGU1IWqKarqI6I6
xxDK3PiONc1x328j2zyhxwRs6y+U3sTbuCzRjkkTcVF/MH07uXJ6O9P9yNPx7fV53y9IfYrzVR2r
gRUkMgRzWxcl+SO0cLyp7sCvuSB2Pii959MkQ58/qdalaGak/OGO4WUSSb+Mq0ygN9FdkclRooFc
EQJmGMiQAFrHxVCGlEy+tccvwKEy3UtQlSe7qMa81LJSmgqcCMv13aTNvILg5BRcELX8Ec3KFg20
ApUcngVUYp/eWHFo+LZZl7qumcQWt/luE+VZYjJj6UZkDf4usYGC+aOTYaB26SYVY8qLmNYm/XmB
e/JNfoven45n8bMy0MSMV+BcqkmjPK/A4fRD+kfg/Y88jmmzUoslVawXmSX66lpJPkqyZHS+1DZp
uWxXEkpn6vh/zdMO5ULqztJHK5u8Hh5hwwl10LYKkDDy2jSWC9tFcbPeqiUw4m6B3XQyuK6lQElA
WkP3Ka1M889ZKdPiFehVqLSM/rtXKxFX62WEHUwBLKKYjpaSEV0rSQZBA7Ws2P0rOo0ZfE8Hn2DP
U4DSAVlWZSPZiI002ktyJdKC6LQ8jaXQFkB7UMI88qEt5pkhYAjDFw3+lWdgXjVZhVpNA7zJ6FJN
MrkWtA5Mw0WtyOd7bOMKyF2Ut1Ut57LJ0jtSlWJESVah+4YJBpmagf9bhdSmagX+jOYGX5qAtndZ
uUIDJPNGleAGulVLzmPVoxAQU22B0Z15tcE85TKwWmb6Muqp8KcWemegLyQbSyA362Kep3WUOPhK
A57lzLOk2QTEu1Wa5vokK6JlFhd0/FOVnreN2hVFdL+gO1Jt3JuUT23TssvipiLVolVyqyCiS6os
R4hPl/WzS6CXbaYWSz+SKW4Xy9Z1VIJFI53e2PU940jbKL8XvQAzKoT8iROUOO6rcNiYjs4XTb7Q
EwCoFpS41S4XTVkRaXKWRNmtdpOoIOsSU/VmKPgoAntiuZ6kTaNCI9EJQ78ZKVGAdVnna4XYFNrw
LEH9LSI3RCgpoqb9s7qH7MyrNtvg8QQYWNUkNZw6GL6iSxo7Y3EQIsPoMQNEuvl7BuGw7nY1ceWO
uMsyiDurdsY2KwtzMx7SplI7QYTvE/pxrUptJjCz8t0KDQXBPrB5LTmKxz72Y/QSbBfCQqVk0hFC
4x12SQJx2IqQ+a5axdkuz9qWbvfTkn5TBbECOKITBWS6ZsCKHN9IAsM6rzNjcCoeZ7wsTY7fAe88
05PdKk6U0rV9EtBYtLxxkzTQ6+8/3o6PtF/z/Q/pxmXIsaxqVuI2TjNc2whQHvzY1KI2Wm0qtW5D
59+oh1JIlCxTXH2gva9TPBYxJGzguEbuslYOYD2+ehd42oJubtoM9dxbpne9aOw/VfQfv/bAaLv+
86Mj7LvBgrVJn0xgmDcgsUu6WWNxOOkWYJnq8THh8gIZOZZDFLU2rnTD4dK1HF8M7svJxA08X6OC
bxZXr2RcBC7q8XCE5TCpjM4ud/B30xHHLqJH1FUqCLclslPRgTxDjRsG2BKNtBhVVRJnRO5M3sGp
ipUHgxASM7f0EKKv5pvXvqRi1BP9LZi+FoUsVgcUfQMaUa3TKDFAOq0OfetGTvJN19gPvlrhjop1
BUCBu9XK7izkwDeIQaIMbKhPEp656GGcUUQ7M2mGJg535SS1sHX9mdpXbRyB8rJKzWN/Zmsjhdmc
CAD6UN/jnTWHviL8v839MVh0m1ng0jVAHXkxOCOuvchde6a2pQOc7fD0Mwod9v7y1/Px9K9P9q9M
mjfL+aS7UX0HN/TY13vyadzl/KqJrTls9PCjH8O5nfONrsi3dLTNOBj7mTqBWzSPK0wTJdr4Izrz
vJbLwrU9CxXY7eX47Zt0ZcHzohJ/KSmGimT1BlDCKvqdWFWtVoseL1rsOCGxrFK6rZ2nUWsoAjlE
SHhcrw1IFNPdcNbeG2tn2OxIPL1THDYsrCePr1d4gH6bXHl3jlOuPFy/Hp8hKNrj+fT1+G3yCXr9
ur98O1z1+Tb0L4TLztISU4OXW8r00I2toUe47MYy7NnKtDXpcCvZwQUadkqVO1k1647imO4dsnlG
97D3SOqmjXdS/CIg9HuYIRcgruK2oovOkAdFWrpXlvPpiP319C+X66P1i5yr0bSXYmUXfZTHmGpp
b/avhdIuB1izsl3wUEiGvBgDXC2rzWKAaQhYDZsNU9jW1jCcJaBW2s1jnyqaz/2HVDxkjUhaPczU
qnBkGxo8mgwsRvPfjiEhtmtNsdw5sovp9F43punQM049veLgw3fq6PTVfRH6AdJScPI5E1VzBKCz
k9RqiTzbYRyin3MZMOWq+W/RmBrix+4UV+jpeTKS2w7qw0TmkD09KRim2NezbCmDr7eN+Yx0kD5m
gIX1PkNcI2IEQmwkPbsNsYFk9N1d0urY6HFA64f5F9fBjlXDktNMqHpAc6ohIbK1Vj+sgy8aBOCe
dxWA0MPFTH6T7aEF/aSjnpmHTOkSVqzNR8QPDXaBQuKbcz8t6IENneHNhiIGq3yBBTebGxjC0EI6
ivgFQkyoNAl7CQ3hKo3ykEWdhSekOhP5Iebjh3I0IfQchi4mjhjd/Qlz2rFFr7BSj81iNG+O6Xnz
qJfP+yvd9L58VHHbkSzVR7qvOHcQEN9gjC2I4BBcSBZZ/oEIn3qIqGbRhDy0cKOLBYEBkxmk/WxP
2wiTx17YysGwRAT16iYy+Og3siBF4KBep0fh4knnuWFMaz+WzIA7Ogw1IjYQk0wBQQ+ePcPDffml
GMIxnE+/0Y2xMlm0TMnqRoZjqEYF6IIr6sCipb8sTBxqpux990xda9BhhJMaOZze6NFOrjfX+yui
+XohWAOOD8X3ZQyWoKgeGEu1K6pNuiurNltIp4EOpUcQ1ftmb+UnF9rnGq23SUbqPBKfYxLPk+JG
fSaW5JuW/9+xy1vrb3caKgBzL/rHELQzK5ag35Zl8jtJF1kZdvti2Hn2dwi7bCnkpoLu+cOXyfxu
jx7hCZF82HAUQsAP2C/CJhpiirDXHfBqit33iwzSdZEAsKtJJK3SrC6FmAn41blh7QiweOnD/8M9
xVojbpI6UrOGSIegpICK944hK+u1sPfQsllVpGUlalKcOVh7O3+9TlY/Xg+X3zaTb++Ht6tkbtsr
+n3AOpa3bNJ70zU4aaNlhr9vsRizufC0Rf9AzFbadilwF2PM02UU38v8qzv6QS0hznK/gmMWBpmc
3y+YX1N2kcA94UoUOj3nqVQN0sSKW1Z60upfPsAr+C4uWjNYtGvRM/eqK0dO01NlZvb6CnFtdnXW
Bh4PEtvrWmGtGxJGWT4Xo6kOlrnFSph5PF7trpBYu7Ts0DecPg8v5+vh9XJ+lAT4EMNYQ3mq15e3
b6jErwuy5IqHS7jnAgIq8eQcht4CLbG7rBmdDp7fT093EL1uVBPlQBVPPpEfb9fDy6Q6TeLvx9df
J29wF/f1+Cg4IuR6qS/P52+UTM4x1koM5ulohocnYzId5cqol/P+6fH8YkqH4jy40bb+fXE5HN4e
98+HyZfzJftiyuQjVn6F9M9ia8pAwxj45X3/TKtmrDuKC2Kgiul018TR9vh8PP2t5Nkl4TF/d5t4
La4BLMXwXvpTQz9Wqi7gGmTRpF8Q8ZRu23i8c0v/vj6eT91cE2bRkBdnZ56Z/1TiXqo8CxLNPNSl
Tccgvxp0RIgL4ooOp0a64oVVBLgjVrUGSFg1laVuS99G93sdQ9OCh6ZIK5YUvi9uRDty/2AqCJ20
qEQ1sUwEIdQP3fgsxIvfkbaL5yiZ7pZM9LSkn6EUReGVUfN+B/jnRbZgXDK5u3lME7SG/Keo6imk
0VhZqWRXs2tYzuKILOQO0SfvgC4BMkRyLXstSy65Hh8Pz4fL+eVwlVZblGxzV7zn6ghacMciwj0/
zouYzhd2+yrsn0Sq7NExiRxxs5pEkuMqOmJNYgUqQTZTAhLqAODzliQSKyOozqIFNP7zs23ZBuP7
mJ64UT8ARTT1xBXZERTPlZQYyIE+KSlUfO+OyMz3bdXhKKcqWcx81JKgYH4LZJfc2zhw0GMuPcaG
ks0xEOaRL8X8VqYMn0anPf00MouSzhyKikcqE9UIyVEytWZ2g5VNIWdmixNuGogjzv/vsgW4p6QH
C7opTiVv+JRhhjpbjZKMxX/jfn97IvfXrtHCUKbFYFdp2TKR+yenAkyipuUmzas6HeJfirVbbaeG
OHo8wgkUgL1ttLHjia4MGUF0984IkpvWaGvzG89xxKPtLDAUD7GjPAe/8KVnht2DzbsEZ2Be1Q11
L6O1Gh+oD/Noyo8k7JNZVAl/pUbnKLiKljq+ZWNrhbYkmhiV2ErY3RHu/AAXeOWZN2BXG+PNIrAt
ufRuY7Lt3Ur3y+TWkhAXDbPNmqSS0ShI7CYlcZSnSJ5Cim7b+vpM9zSy8ncRe44vJR65+JL8fnhh
+kb8jkMU/i09De/qVaeiJiwQBqQPlYbMizQQ5Tf/L4u+OCahKNSz6IsaVoLEiWv0wAxlZg34RSLL
WonlVhNUJm8ewtlWOjOpjeY3Pcen/qaH9nxnmieZEKAM4mgVZIxIxBrNTx+k7tPpmeqg9KlvlQxx
rOtB2RT1PNnzmSJJ4UEc+lbgiYLVd8Who/89TxK8vj9z4OFbVDNmVLeRCEEoJwtmgfKRr6uWCk+R
QjxPclUdOK6oXEQll2/Lws2XIkhR8eVNHV9Z+LQM30c9JPEFzOugOc9CO44/ddJRf3p/eektmuSl
2rnc721b5J2ZgPG9F34zovHy3SR6KNZq01lLHv79fjg9/piQH6fr98Pb8T+gZJIkpDNCFu5ElofT
4bK/ni+/J0cwWv7rHW4Uxdl5k48/AXzfvx1+yykbPd3m5/Pr5BMtBwyr+3q8CfUQ8/5vU46GnTdb
KC2Cbz8u57fH8+uBdp0i3+bFUrJ75//lqbrYRsQBdwEoTfNGX69dizspNw9uC9YR1c6lexHspjBr
l65jWdi81NvCxdZh/3z9Lsjvnnq5Tpr99TApzqfj9axswRap51lYXDQ4UlqSF4mOIhkWo9kLoFgj
Xp/3l+PT8frj/yl7suXGcV3f71ek5unequ4z8ZLtYR5oSbbV1hYtsZMXVTrxpF2TOKk4qTNzvv4A
pCgRJOju+zDTMQBxJwiQWIx5GBqTjiee8zlc1h6JZRmiTMabCABuzEcBW9bV2GQc6rc9kcu64fMC
xhen5pM0/h6TuXK6qfgGbJ8PNPt62d4fPt+3L1s4uT9h2MhyjK3lGA/LsW/ZfJNXl9AIT46bVbqh
0XDi7KaNgxRztR5Zl0AEa/ecWbt05SZVeh5WG+cY6uDsEdXjJoTZHhkSZRkmHVydTSvCb2FbEa1Q
hM1mRN6tBIbror9hTxm3AKIIq6sJjUwjYVdsRFdRXUxIjI7ZcnRhJijA3yRpewr0ZnQaBNCnW4BM
xrxuGaAZLqccIeKcqnyLYiwKXyZ2hYSen55yLyIyQxHoNAmTZS+ukvHVKZfWUWHM6HkSMjJDSXyr
xIjEdyuL8vSMS3HoWC/X5Zn5MpncwExOg4pwo+nUjtCnYHzc8iwXowk7nnlRT1QkueH2T2DeZ4Ty
mkk8GrHRlxFhZUquV5MJy4NgUzQ3cUXywmsQ3UJ1UE2mo6kFMC9k+lSRMAdnVN2TIDYeNWIuaPx7
AE3P2BwqTXU2ujRzPt4EWWJPgIKx79g3USp1KKMACTFjANwkoA4av+9gZsbjbmY6hkEZgnq3un/a
bz/UFQTDKlaXV6btlvxNpkisTq+u2JwH3Q1VKhamQ/4AdE5+sZh4UqikweRsPDU61/FFWYyUAngU
WopY6D4pehqckWRaFoIuIo0s0wk51incTrvEju3/9DH63p63fxN9Qmo/DdGyCGF3Dj487/bOhBmH
AoNXsUo6I+GTrycqPODz635La4/RFbFsipq/V5VWkQaqr5QvujuE9iDnSOuc+/3T5zP8/fZ62MkU
Ls56k+x02hZ5RZftz4sgEuvb6wcchTvmLvZsbO78sBoRCyXUiab0jEGt6HTkyVgFOH7D10ViS3ue
trHthjH8oN43aXE1OrUj/3tKVl8rxeJ9e0DJgJUYZ8Xp+WnK27XP0mLMvqSEyRIYD3m3D4tq4olZ
uCzYJL9xUIws+bhIRqMz+7erHCTAItj8jdXZOUmRKX873wN0woUQ6ZiG9GR3WImEWofKmcpFbXR0
fHrOS4Z3hQC55ZydOmd+Brltv9s/cfvbRXYz/fr37gWlZtwmjzIA6AM771LU8HjjxKEo0UUxam/M
q4PZaGxeJRSxmdO1nIcXF1PzZaoq59QqrNpceY7xDbTklH5pSEV4JFJzqpvkbJL02UGNcTza++7d
/fD6jB4m/rv1/g3+KKViptuXN9Tn6eYy2dipAC4apSROYZpsrk7PR6zOKFHmMNcpSKXn1m9irVkD
Q2YnUiLGxF2Va3A/oaZ3EyaHl4yeyHTr9Eg4E5lPvkraec172SC+GxPOMgiw0nnLvIyXrWByLEq4
zF3IF1SvE5scQG3CeDrG5fXJw4/dG+PtW16jpQiRc6B3MZsStUtBW16TFd81HU9Uz4U/cBZsAXsr
Zbesb1ghghX6+pK6ojKG5sVFHtSCi8YD/CuqjQj+5scKNysDaM+suynnbUYlIQoISbtYHyGpY8ah
SvGo5e1J9fn9IA0JhtHWyZcBPcy/AWzTuIjhlFmSG0HpGr1IkYA/wYK0XWFWPyAc21R6dUDhnc1j
W+dlSYLmmEi7chNXxSAysevaJBLJTW6XgFsmTjeX6bXrzmyQpfEGxrwfBC9dsRHt+DJL22XFrlRC
g6Pi9Ah2YXG8KaIolnkWtWmYnp+zz9VIlgdRkuPNehlGRJKjK6D/BAOLQNXmXfSM/GiTon8JKLbv
aC4tGfyLujfjrOyOkfUbQ/TRLsX+8f1192jIillY5tTjX9P0spAwrnG0h5H5s+ej6vpuffLxfv8g
j26b4wBLMzXZFE3najRYrEw73QGBhnHEOQ9R8rbbYyyYoqVX2eUjzBNP9KqBrHfe4x8ONdm8LnUC
d3175/ayv/UtFuYFkjKYK0rgXNa7vIOSNnfG9TEUhO7s4SKiPFp+Ni+j6C7q8Ezzu2fGAl0Ag7wp
ElPNkUWX0YJE3snnPFwCwzk5cTSsnaf8IPcEYt4wrZtXRpQh+CGDA6D1ZpaHpLeI64JzeNwdDYpl
M6OldnAhA6FQVEXCLUnILEKLHQrMA9MYA8MOwEhuhowghurK2S1idhYRLi6uxnxgFMR7+oWozoiU
U5RdG8fYtMnEX3iEWlZTVRKnMzOcCwKUXWWXZsm464Whg78zK+tQh4Y1ldVkTcF+uW5ECMvNGLHe
HrUG/gbcr25oAh3LJE49TO2eQXqT3NMQN7socrAbK7TnqEjdoLnkqSCyTLSpxy3r3giYSUslvw6E
OnkMMxbw0oGmqqKgKXn3UCCZumVP0Xu6neelbJWv7OkvtWD6Ky3Qgf1M2KrJ4loa6Rrz/20Wjukv
+1uoLZ0FIliSNLExjD9gaE97MBB7jBh7EhnSMM7m3NI3im83oq5LtuZhqNg2HB+lb7rxxm+zPAOs
SzFrQbhfU5Bf1aKOMRQKtwI3ztAhRMeCvOFzkiHJdZPXnBS24ZuPYDOvFv7OMzgYQFYLSpNbGpgy
KkRcUtRalJndXH//F/PK3no9DmNVepGzWs0cZx0UJ+pDY2WOrUmUABx4a3A7QrWWuCNkrNcsU750
n4+zbyrHllM7Bj2QdycxdRbR6OSOjwQ14PnZ1vi7quYjXt2BhOobLH41RBtcXjZzUrB2ho4QbV6w
xcVJhBl0V+pKxLjMzkI0u7olFHx3qhZUhPK28IQBBfxN1O0yG8RwpA4xa2I4kTM47RaZwKPFnL2K
cZhSIO5uTGFklAsyjcL9pEf6diOm65tXU7KYFIyuL3kokOkIGk/I1c51h53tHEYjEbek7AGGAfvi
ElZvG8akaxyJSNYChO45aND5+mhVMGJhtGErTKNaBHlxq2Wk4P7hh5mWcF5Zx0kHkFu3csFL4KP5
ohSpi3JWhgLnM9yubRJXBvOTKFyoFQezizIwZv2DvYvqlOpg+LXM09/Dm1DKLo7oElf5FSiS1lx/
y5PYE5vrDr7wsMgmnDvcUzeJb4a6fM+r3+ei/j3a4P+zmm/oXLNOvcEr+M5q9o0i4vYwIHS8kQDk
+AJd76aTi4H/2OUriP4mztFfrorqP377/Pjz0vDZy2qH0w0S5LGeKV36sP18fD35k+uxE1lZAvBq
p6ZXbAgGQTYJy4jjX6uozEiA5k4n1rtfB59bxAuR1XjlQ3wW1T+DVKDVe7flg2RdKa9RjBkSpebW
L9Ev0pEwROg7LcTcYkyRZNQ8qPOptE6Cpa9sQGCsQ1LWzG2cBPlCm8zs5jmff5sfESqaWcysHj3w
sK3Zhlegy1RLMqUdRB12moUN1woErfgpf/+gCVExT4sWA9H6riosUqmAHmksoUO3EBJdqKeyZOoe
fqcC27jV+4QUg4CXcoYq7441G4UctuLpCm8FZslKxtw+XkWUziLQPrmITcPclGKRRlnddgcOBvKe
GLxt41vHaZyBOEV4YwdpQfKIb9xgl3lqLdtlYQGus83UWcoAPPc1ohzKHPQdCcMoU+hRdKvkOF71
sij54FZOebkZfFxh80xVw8DT2nT2hnPTvPFSv5HfJ6jIa8nZIYDVdAw5NZEDh+7Ry6An4K5uFd3l
dHysGFyRv1DKkRLsXupjjr92djvO0ftHQlMzDTF7+vNCnQJ/e/7P9Den0MC9YKUE6LDLNAbYrf8b
VGmc+Z6ZPtsDDP8D1oCu/S5uhd7CVpR+A43JlstIVKCxjRl0wXwNp+yNtfMa3zaNytzZphrmPeR6
As2c3U9/cjWkybhbD5fqLi6YVmRRvc7LFS9YZBb/wt/mC7r8TQwGFMRusomc/vFikU9bT7wfDOiQ
eY5x1TTJ1L141La6OABhxl4xdEQoy0UJEtG+hXElZnC2N2HBhTEGEo6hLkrpgQYKa26wRmSf9k8c
DVKhHU+xarKyCOzf7cLkkgCABYCwdlXOqKGhItfdiDO5UvDkCjAYsCcCQ/eR97IniIolvw8CkLvM
6cXfSsfjnBclFkNXrIeWqekiCjJSrSMBu3SNAjUfnVhSNQUmgPDjfbdBEulkRhmg/P3tgMcXqgLT
JngkTkn4C+07tp5BvRI+kVb4pd2rwnO5Zlr2wo+B+e8Or5eXZ1dfR7+ZaK3dtaDd0Q97zMWEGHFQ
3AVn3URILk2raQsz9mLOvBhfM0lIXgsz8mLG3q5dnnOmYBbJ1FuwtwPn50eq5LJdEZIrMwcwxXjH
+WriG+er6ZW/MRe8poBEcZXjWmp5O0NSzGjMBg+waawZkvGGKEjXOeLBzkRqhG8WNX7q+9C3sjX+
nG/IBQ92BrrvD+8RQEh+PhMeXxokWeXxZcuxxx7Z0CanIkA1wFSBNDiIMFw7B8/qqClzBlPmoFWJ
zO6+xN2WcZLEvMGRJlqIyCKxCcooWnHFx9BakXEneU+RNXHt6bynzXVTrmI2YhRSNPWcZtZOOCG5
yeIgN/PidIA2y8tUJPGdzKQD4l8y7yLxdHRx3q6vzWsl8sCqHE+3D5/vaFk4xCfrPraTJeFvEJ6v
G6iidQ4oLUxHZRWD9AiKNtCXcbYgZdSYciMKnTNSy6jqoaAjsCpvw2WbQ/mys9zXSCPv7ONA0RAR
qJON2zCNKmnLVZex757mmBytkfylF4acWooyjDLoBD4p4HW4FG4CYTv622SsKYrAK0OkSGHCl1FS
kFxpHBoDIC//+O33w/fd/vfPw/b95fVx+/XH9vlt+96f5frmdRgW09k2qVLQ/l4f/np8/ff+yz/3
L/dfnl/vH992+y+H+z+30MDd4xcMMfyES+fL97c/f1OrabV932+fT37cvz9upRHvsKqU0cT25fX9
n5PdfoeOXbv/3HfOpHq94js1dCpYwURmNHYJojBQjszDNgS3Zl90FCkaytAw2EYyUrYdGu3vRu+S
bW+bXobEBZz3DyDv/7x9vJ48vL5vT17fT9QkDP1VxNCnhSiM44uAxy48EiELdEmrVRAXS3PJWAj3
kyVJvWEAXdLStJMeYCyhcU1hNdzbEuFr/KooXOqVmVpLl4B3Gi4pcGuxYMrt4NQJT6E8MfDph72C
ZZladFSL+Wh8mTaJg8iahAdyLZH/cIeU7nNTL4GPMl/aobkptg90pF5OPr8/7x6+/rX95+RBruEn
zMP5j7N0y0owNYXceafrMe2qeli4ZIqJgjKsuGdWvYhTd26Bnd1E47MzGalYmT5+fvxAx5GH+4/t
40m0l/1B35p/7zBf++Hw+rCTqPD+497pYBCk7kQysGAJJ6IYnxZ5cjsiedX7DbqIMcituxWj6/iG
7f1SACsj4dZVODjpcI9c/eA2d8bNfDDnUkdpZO3uhIBZvpFptNrBknLtwPK5S1eodlHgpq6YtsIp
vi4Fd0WlN8bSP8Z4EV837uyglcaNXhDL+8MP3/Clwm3nMhXcoG6gT56XJYm/gc+cuQt3T9vDh1tv
GUzGbs0S7I7bhuXRs0SsovGMaanCsBc1fT316DSM5+5SZ6vyTkAaThnYGdOmNIblLe2+OVldc5c0
5HYMgk3tfQCPz8458GTsUldLMeKAXBEAPhsxp+tSTFxgysBqEEVmuXta1otydOUWvC5UdUqG2L39
IG5+PUNx9yjAWppBsV8C+XrO6yF6DYg0AuVKuItQoLxvXUgaOHcVINQdxJBp71z+646XSCrBzJlm
sgwPLQvl3WB3vEp5ZVhPwDq3h0UN+uvLGzqvEfG074h833GZ4V3uwC6n7uwmd+4mkY9XDrR7HVX+
Xff7x9eXk+zz5fv2XYdb0aFYrFWQVXEbFCUbPld3opwtrODCJmbJMUKFsTKDmriAv1YdKJwiv8WY
rCVC153ilikW5S5Mj33kxtci1JLtLxGXHqM1mw6la3/PsG3SotUS+59339/vQc14f/382O2Z4yaJ
Z+w2lvAywCcSF9FxczfMuUvD4tQmOvq5IuFRvXxllGCPGyX0DxzScWwB4fqMARETH+RGx0iO9cU4
q9hmWnLb8cZ6zoelKwWhS4OoUzt6pYPlxOEBi/WdTt2ZQAo7YLiBqsQ82pB4mmbJKSYKDtrF5qd4
2zROVLdpGuHFibxswbcjFlk0s6SjqZoZJducnV61QVR29zSRY9JfrILqEpPi3iAWy+AoLnSIdw8W
lZ12ZaYdRlPRCNMBKzsdNCTVN0X9vsWAM39KTeEgM7Uddk975VP68GP78Ndu/2T4NMlXUvNKqySO
wy6+Mt6sO2y0qUthDofzvUOhHqinp1fnPWUEf4SivGUaM9xbqeKAM2Basqq/n+MNCn9hIHTtszjD
qmHCsnquRzLxsj60NBdlK03VqPWEcIyI+xpAfsKw+cboaAdKEK2yoLht52WeahtehiSJMg82i+q2
qWPzHSzIy5DyNUzRHIFKns744P0gQIOmCGeZuaOCEeEUQevK2EEb101Lv6ISP/xkLnY7OGyyaHZL
bpAJxif6SBJRrmE1HaGAYfdhzzkX7wBPLNoULhgB8FFX3QkMKb/XbwYLAJGFeWqMBFOsZdZjQJVp
HIWjwRse2VSQu1MHkgXljZIQypVsWSkNUMM4iVKz7TOtkCwwR7+5a4n7lfrdbsxAix1MuqMWLm0s
zOfJDijKlIPVS9gKDqICVuyWOwu+OTC6mocOtYu7uGARRLiemWnj4Yc0SqplsF/TbEVUVR7EykhP
lCVJeiKk4xhxac1pHPAsAkZayXDRLbCPhWkNhzBoXCKkQdQyoq7ViM3yTCMw6DJxUEM8SpU+i6Bq
kah7bqPIa+OwXiT5jP5iWESWUFtPze9EnYPObU51kNy1tTAjo5fXKDYZNaZFTFIf5pgLHi+0ajMS
e4W+zrnxmbzKD6MiN/NXAFtJTWdofIjJFmYPjGAg1ilCHxn0gSyhb++7/cdfKkDGy/bw5D5oyRNq
JbNnWLwdwWiSwd/xKoO3FqSiBE6hpL/JvvBSXDdxVP/Rm5BpScUpYWqsidtMwLx41wTBW/7EIHjN
chS4orIEqsjcQEgN/8HpOcsr4oDpHbBeAd49b79+7F66M/8gSR8U/N0dXlVXpwY5MPQ0aYKIRtYZ
sHqfR7zLk0FZFYnnXDKIwrUo5/zptwhn6AIXFzX/Aikv8NMG7zzQL2zoyxyYS6T84UanY2PqcAEX
wGzQHz5lrXdBe5TFAo3BgiIMrYHuNLBNzM2m+lEptzM0909FbTI8GyPbhD58t3ZjizzuXHWtQZrn
6N2urKlUKlpeDPzVRSCXjLyT2D3o/Rluv38+PeHrWbw/fLx/YvhGY7mkApUMkEplZBEX2L/cqSn5
4/Tv0dALk07FB+G2jOpqxXRf25v5zLB6MnzRkZQpej0fqaQrMCOGrPI5WHqArGDZme3A3x6fhUpk
7GT80vDSZil7Rrf/6ELiXHl1b6J9uQbjROYFegiG1aa+jqo4xMvzijMIwG/zdUY0NKm25XGVZ5aS
QjF4JMNo+F7iLeK7qORciocmwj6c27tM+YtVHjA9lFgKfGT21qqJZMImbyVod+vDlUEjGYUPrzw9
XJ98StVxNX3sjOzOVIngHojk8u1WEohKCbALdyA05sg+Ui/6DZ6BnLQDfDbsaKIstNmuKuImdSHy
hYX6E/aocua2FMDFAmT7BW8iqYiyPE2bLhIGx8u7DSRz0EhLA0OOCqRYuRKwZpkrKYXFyVZLW65s
UOVbEYa9JwG1Txj2ojOkSyu4knpdQvqT/PXt8OUEg2Z/vil+vbzfP5HoFAWm3EYbiZz3+yV4DMDQ
RCQ3XxzINZ03mLJvOAjzeY32zE3RZ7bwjDQi22UD41CListtu76GUw3OtjAn/EHe6qgqWB55fACU
wROcY4+feHgxnE6tRccEWIKl/TJbK1ckXS84WKso6iLLqRsSfMQdmPj/Ht52e3zYhZa/fH5s/97C
H9uPh3/961//Z1yeoKu2LHIhZWbXFr0oMWMk45BtloBdsTdNCXpKU0ebyOFTRrI8ugl48vVaYYCr
5Gtpi2TXtK6Id4GCyoZZWo80jo8Kdyt3CO/+VEoOtCCKCq4iHDz5WNDx94rWidGy0Km8tXn/0Df/
RUQVzN3vtULz/5h0okQNcYh0S1Dmg+Fqm6wCRRVWrbokOcLaVuo4+DkFsD/g6BXHrI0jgWgVBvv5
S8knj/cf9ycomDzgtaGjJ1AP7e6Q5oDUmUgzabwM5a/i5LmXtaGoBapJGO01psZfR5tJKw9AawEN
PlYBsNU7XNBwnMOacS35w/Etk7M4Kwkx5jec2hDgQTSnBZif22sCgdE1G59Dh34kjbeHFZiuUgxK
RiWgGqXcJSAS4osBv6LwDi0Lbuuc9TbKC9V8Q2SRS2veZEq5OY5dlKJY8jRaUe5Dd5ECJLBNpbwE
g4s3vRYJeoDjvpKUUoEymIOqUbqRWcWrggPLORL5jJ3sTab2kPTkuQD+qXFAq3WMOp3dN6OoTtWo
1uYtilOevu+xC+oIjbNDq4zOesJMunhy6W/YebZmjLeZlcLdEQIQZkB4mB8tQx7NLoGeu3Xy38Ku
ZodBEAY/GxoTTSYSMNtuZgez3ZbMZc+//oD81e2KGKAtpS30q5rjYuP0mDGeq5LC8Dx1WhnXp5Gq
4kPwlAvCN6B3gV++VHH1bjW0Kw1KS+HdDP9wkHS1dwcJlDqGQU+UHr1Qvb5MDoP4cwGZNEak5z62
Ji+ykTwsk4x1c0Qi2gtLA5u6H5XNPIFUOPcO4vrCcOqEYItV8euKbbMCFWkqDSmO/LezAV9thOOA
ggsIWXJ0gkda4TaqdLdTWH3HVeb39hBPBloJDEquh2SzuR7njjd4IB3DJIIS0A4qrmMp3SzPDKDA
F9gEFwRpscUg4E43CPWsB2nVrBTTgzJbTxp6ndftjfYLmtbt87O+bvcEaZ3gxuKUGH2Mpp7mkEZQ
srKtuxJ9K7LzV9LNaLLJWSDeMsBQ6GQjepMsZDnCkxT7ZacNXLV2OntOmuxm0ALNSEXClFAWy+rZ
gbjdWNqCP2lZvUTnWPcXvsQskTiGAQA=
--===============0055337488022911137==--

