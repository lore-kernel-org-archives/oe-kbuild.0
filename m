Content-Type: multipart/mixed; boundary="===============2307318113964861176=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v7 15/18] pstore/blk: Provide way to query pstore configuration
Date: Mon, 11 May 2020 07:11:20 +0800
Message-ID: <202005110726.inndUuNl%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2307318113964861176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200510202436.63222-16-keescook@chromium.org>
References: <20200510202436.63222-16-keescook@chromium.org>
TO: Kees Cook <keescook@chromium.org>

Hi Kees,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20200508]
[cannot apply to kees/for-next/pstore ia64/next linus/master v5.7-rc4 v5.7-=
rc3 v5.7-rc2 v5.7-rc5]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Kees-Cook/pstore-mtd-suppo=
rt-crash-log-to-block-and-mtd-device/20200511-043555
base:    30e2206e11ce27ae910cc0dab21472429e400a87
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/pstore/zone.c:822:12: warning: Either the condition '!record' is redu=
ndant or there is possible null pointer dereference: record. [nullPointerRe=
dundantCheck]
    int cnt =3D record->size;
              ^
   fs/pstore/zone.c:826:15: note: Assuming that condition '!record' is not =
redundant
    if (!zone || !record)
                 ^
   fs/pstore/zone.c:822:12: note: Null pointer dereference
    int cnt =3D record->size;
              ^
   fs/pstore/zone.c:824:14: warning: Either the condition '!record' is redu=
ndant or there is possible null pointer dereference: record. [nullPointerRe=
dundantCheck]
    char *buf =3D record->buf;
                ^
   fs/pstore/zone.c:826:15: note: Assuming that condition '!record' is not =
redundant
    if (!zone || !record)
                 ^
   fs/pstore/zone.c:824:14: note: Null pointer dereference
    char *buf =3D record->buf;
                ^
   fs/pstore/zone.c:995:28: warning: Either the condition '!record' is redu=
ndant or there is possible null pointer dereference: record. [nullPointerRe=
dundantCheck]
    struct psz_context *cxt =3D record->psi->data;
                              ^
   fs/pstore/zone.c:999:15: note: Assuming that condition '!record' is not =
redundant
    if (!zone || !record)
                 ^
   fs/pstore/zone.c:995:28: note: Null pointer dereference
    struct psz_context *cxt =3D record->psi->data;
                              ^
   fs/pstore/zone.c:608:6: warning: Redundant initialization for 'ret'. The=
 initialized value is overwritten before it is read. [redundantInitializati=
on]
    ret =3D psz_kmsg_recover(cxt);
        ^
   fs/pstore/zone.c:603:10: note: ret is initialized
    int ret =3D -EBUSY;
            ^
   fs/pstore/zone.c:608:6: note: ret is overwritten
    ret =3D psz_kmsg_recover(cxt);
        ^
   fs/pstore/zone.c:1351:6: warning: Redundant initialization for 'err'. Th=
e initialized value is overwritten before it is read. [redundantInitializat=
ion]
    err =3D psz_alloc_zones(cxt);
        ^
   fs/pstore/zone.c:1288:10: note: err is initialized
    int err =3D -EINVAL;
            ^
   fs/pstore/zone.c:1351:6: note: err is overwritten
    err =3D psz_alloc_zones(cxt);
        ^
   fs/pstore/blk.c:233:7: warning: Redundant initialization for 'bdev'. The=
 initialized value is overwritten before it is read. [redundantInitializati=
on]
    bdev =3D blkdev_get_by_path(blkdev, mode, holder);
         ^
   fs/pstore/blk.c:218:28: note: bdev is initialized
    struct block_device *bdev =3D ERR_PTR(-ENODEV);
                              ^
   fs/pstore/blk.c:233:7: note: bdev is overwritten
    bdev =3D blkdev_get_by_path(blkdev, mode, holder);
         ^
   fs/pstore/blk.c:402:6: warning: Redundant initialization for 'ret'. The =
initialized value is overwritten before it is read. [redundantInitializatio=
n]
    ret =3D psblk_register_do(&dev);
        ^
   fs/pstore/blk.c:364:10: note: ret is initialized
    int ret =3D -ENODEV;
            ^
   fs/pstore/blk.c:402:6: note: ret is overwritten
    ret =3D psblk_register_do(&dev);
        ^
>> fs/pstore/blk.c:472:20: warning: Unused variable value '_name_' [constSt=
atement]
    info->kmsg_size =3D check_size(kmsg_size, 4096);
                      ^
   fs/pstore/blk.c:473:20: warning: Unused variable value '_name_' [constSt=
atement]
    info->pmsg_size =3D check_size(pmsg_size, 4096);
                      ^
   fs/pstore/blk.c:474:22: warning: Unused variable value '_name_' [constSt=
atement]
    info->ftrace_size =3D check_size(ftrace_size, 4096);
                        ^
   fs/pstore/blk.c:475:23: warning: Unused variable value '_name_' [constSt=
atement]
    info->console_size =3D check_size(console_size, 4096);
                         ^

# https://github.com/0day-ci/linux/commit/2ce3ca24c0ecefdcce529c9295843ab71=
8791f65
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 2ce3ca24c0ecefdcce529c9295843ab718791f65
vim +/_name_ +472 fs/pstore/blk.c

1fe49524a73cc3 WeiXiong Liao 2020-05-10  466  =

2ce3ca24c0ecef WeiXiong Liao 2020-05-10  467  /* get information of pstore/=
blk */
2ce3ca24c0ecef WeiXiong Liao 2020-05-10  468  int pstore_blk_get_config(str=
uct pstore_blk_config *info)
2ce3ca24c0ecef WeiXiong Liao 2020-05-10  469  {
2ce3ca24c0ecef WeiXiong Liao 2020-05-10  470  	strncpy(info->device, blkdev=
, 80);
2ce3ca24c0ecef WeiXiong Liao 2020-05-10  471  	info->max_reason =3D max_rea=
son;
2ce3ca24c0ecef WeiXiong Liao 2020-05-10 @472  	info->kmsg_size =3D check_si=
ze(kmsg_size, 4096);
2ce3ca24c0ecef WeiXiong Liao 2020-05-10  473  	info->pmsg_size =3D check_si=
ze(pmsg_size, 4096);
2ce3ca24c0ecef WeiXiong Liao 2020-05-10  474  	info->ftrace_size =3D check_=
size(ftrace_size, 4096);
2ce3ca24c0ecef WeiXiong Liao 2020-05-10  475  	info->console_size =3D check=
_size(console_size, 4096);
2ce3ca24c0ecef WeiXiong Liao 2020-05-10  476  =

2ce3ca24c0ecef WeiXiong Liao 2020-05-10  477  	return 0;
2ce3ca24c0ecef WeiXiong Liao 2020-05-10  478  }
2ce3ca24c0ecef WeiXiong Liao 2020-05-10  479  EXPORT_SYMBOL_GPL(pstore_blk_=
get_config);
2ce3ca24c0ecef WeiXiong Liao 2020-05-10  480  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2307318113964861176==--

