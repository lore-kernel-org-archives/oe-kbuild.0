Content-Type: multipart/mixed; boundary="===============5929028438274593404=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] NFSD: prevent integer overflow on 32 bit systems
Date: Tue, 15 Mar 2022 15:35:45 +0800
Message-ID: <202203151552.RotMz4kf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5929028438274593404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220314140958.GE30883@kili>
References: <20220314140958.GE30883@kili>
TO: Dan Carpenter <error27@gmail.com>
TO: Chuck Lever <chuck.lever@oracle.com>
TO: Trond Myklebust <trond.myklebust@hammerspace.com>
CC: Anna Schumaker <anna@kernel.org>
CC: linux-nfs(a)vger.kernel.org
CC: kernel-janitors(a)vger.kernel.org
CC: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Hi Dan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v5.17-rc8 next-20220310]
[cannot apply to cel-2.6/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dan-Carpenter/NFSD-prevent=
-integer-overflow-on-32-bit-systems/20220314-221126
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-m001-20220314 (https://download.01.org/0day-ci/ar=
chive/20220315/202203151552.RotMz4kf-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
include/linux/sunrpc/xdr.h:734 xdr_stream_decode_uint32_array() warn: impos=
sible condition '(len > (~0) / 4) =3D> (0-u32max > 4611686018427387903)'

Old smatch warnings:
fs/nfs/nfs4xdr.c:1194 encode_attrs() error: we previously assumed 'umask' c=
ould be null (see line 1103)

vim +734 include/linux/sunrpc/xdr.h

37c88763def8474 Trond Myklebust 2018-03-20  712  =

37c88763def8474 Trond Myklebust 2018-03-20  713  /**
37c88763def8474 Trond Myklebust 2018-03-20  714   * xdr_stream_decode_uint3=
2_array - Decode variable length array of integers
37c88763def8474 Trond Myklebust 2018-03-20  715   * @xdr: pointer to xdr_st=
ream
37c88763def8474 Trond Myklebust 2018-03-20  716   * @array: location to sto=
re the integer array or NULL
37c88763def8474 Trond Myklebust 2018-03-20  717   * @array_size: number of =
elements to store
37c88763def8474 Trond Myklebust 2018-03-20  718   *
37c88763def8474 Trond Myklebust 2018-03-20  719   * Return values:
37c88763def8474 Trond Myklebust 2018-03-20  720   *   On success, returns n=
umber of elements stored in @array
37c88763def8474 Trond Myklebust 2018-03-20  721   *   %-EBADMSG on XDR buff=
er overflow
37c88763def8474 Trond Myklebust 2018-03-20  722   *   %-EMSGSIZE if the siz=
e of the array exceeds @array_size
37c88763def8474 Trond Myklebust 2018-03-20  723   */
37c88763def8474 Trond Myklebust 2018-03-20  724  static inline ssize_t
37c88763def8474 Trond Myklebust 2018-03-20  725  xdr_stream_decode_uint32_a=
rray(struct xdr_stream *xdr,
37c88763def8474 Trond Myklebust 2018-03-20  726  		__u32 *array, size_t arr=
ay_size)
37c88763def8474 Trond Myklebust 2018-03-20  727  {
37c88763def8474 Trond Myklebust 2018-03-20  728  	__be32 *p;
37c88763def8474 Trond Myklebust 2018-03-20  729  	__u32 len;
37c88763def8474 Trond Myklebust 2018-03-20  730  	ssize_t retval;
37c88763def8474 Trond Myklebust 2018-03-20  731  =

37c88763def8474 Trond Myklebust 2018-03-20  732  	if (unlikely(xdr_stream_d=
ecode_u32(xdr, &len) < 0))
37c88763def8474 Trond Myklebust 2018-03-20  733  		return -EBADMSG;
455f80f80ed3496 Dan Carpenter   2022-03-14 @734  	if (len > ULONG_MAX / siz=
eof(*p))
455f80f80ed3496 Dan Carpenter   2022-03-14  735  		return -EBADMSG;
37c88763def8474 Trond Myklebust 2018-03-20  736  	p =3D xdr_inline_decode(x=
dr, len * sizeof(*p));
37c88763def8474 Trond Myklebust 2018-03-20  737  	if (unlikely(!p))
37c88763def8474 Trond Myklebust 2018-03-20  738  		return -EBADMSG;
37c88763def8474 Trond Myklebust 2018-03-20  739  	if (array =3D=3D NULL)
37c88763def8474 Trond Myklebust 2018-03-20  740  		return len;
37c88763def8474 Trond Myklebust 2018-03-20  741  	if (len <=3D array_size) {
37c88763def8474 Trond Myklebust 2018-03-20  742  		if (len < array_size)
37c88763def8474 Trond Myklebust 2018-03-20  743  			memset(array+len, 0, (a=
rray_size-len)*sizeof(*array));
37c88763def8474 Trond Myklebust 2018-03-20  744  		array_size =3D len;
37c88763def8474 Trond Myklebust 2018-03-20  745  		retval =3D len;
37c88763def8474 Trond Myklebust 2018-03-20  746  	} else
37c88763def8474 Trond Myklebust 2018-03-20  747  		retval =3D -EMSGSIZE;
37c88763def8474 Trond Myklebust 2018-03-20  748  	for (; array_size > 0; p+=
+, array++, array_size--)
37c88763def8474 Trond Myklebust 2018-03-20  749  		*array =3D be32_to_cpup(=
p);
37c88763def8474 Trond Myklebust 2018-03-20  750  	return retval;
37c88763def8474 Trond Myklebust 2018-03-20  751  }
^1da177e4c3f415 Linus Torvalds  2005-04-16  752  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5929028438274593404==--

