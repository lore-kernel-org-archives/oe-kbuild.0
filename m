Content-Type: multipart/mixed; boundary="===============4799510208900738976=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH RFC v2 4/4] 9p: fix race issue in fid contention.
Date: Thu, 24 Sep 2020 10:01:49 +0300
Message-ID: <20200924070149.GQ18329@kadam>
In-Reply-To: <202009241246.rYNHBlM8%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4799510208900738976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> >> net/9p/client.c:1469:6-25: atomic_dec_and_test variation before object=
 free at line 1497.


This warning was confusing for me.  Perhaps a better wording would be:
"Use refcount_t instead of atomic_t for refcounting"?  I don't think we
need to print the line number where "fid" is freed.

regards,
dan carpenter

On Thu, Sep 24, 2020 at 12:50:13PM +0800, kernel test robot wrote:
> =

> Hi Jianyong,
> =

> [FYI, it's a private test report for your RFC patch.]
> [auto build test WARNING on v5.9-rc6]
> [also build test WARNING on next-20200923]
> [cannot apply to v9fs/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch ]
> =

> url:    https://github.com/0day-ci/linux/commits/Jianyong-Wu/9p-fix-open-=
unlink-f-syscall-bug/20200923-221306 =

> base:    ba4f184e126b751d1bffad5897f263108befc780
> config: mips-randconfig-c004-20200923 (attached as .config)
> compiler: mipsel-linux-gcc (GCC) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
> =

> =

> coccinelle warnings: (new ones prefixed by >>)
> =

> >> net/9p/client.c:1469:6-25: atomic_dec_and_test variation before object=
 free at line 1497.
> =

> # https://github.com/0day-ci/linux/commit/7e17225563a1d031abb996e557ad28a=
4f6ff3ab0 =

> git remote add linux-review https://github.com/0day-ci/linux =

> git fetch --no-tags linux-review Jianyong-Wu/9p-fix-open-unlink-f-syscall=
-bug/20200923-221306
> git checkout 7e17225563a1d031abb996e557ad28a4f6ff3ab0
> vim +1469 net/9p/client.c
> =

> 920e65dc6911da Venkateswararao Jujjuri (JV  2010-09-22  1455) =

> bd238fb431f319 Latchesar Ionkov             2007-07-10  1456  int p9_clie=
nt_clunk(struct p9_fid *fid)
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1457  {
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1458  	int err;
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1459  	struct p9_=
client *clnt;
> 51a87c552dfd42 Eric Van Hensbergen          2008-10-16  1460  	struct p9_=
req_t *req;
> 208f3c28aab706 Jim Garlick                  2012-02-26  1461  	int retrie=
s =3D 0;
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1462  =

> 7e17225563a1d0 Jianyong Wu                  2020-09-23  1463  	if (!fid |=
| IS_ERR(fid)) {
> 7e17225563a1d0 Jianyong Wu                  2020-09-23  1464  		pr_warn("=
%s (%d): Trying to clunk with invalid fid\n",
> 5d3851530d6d68 Joe Perches                  2011-11-28  1465  			__func__=
, task_pid_nr(current));
> 8e44a0805fc9d7 jvrao                        2010-08-25  1466  		dump_stac=
k();
> 8e44a0805fc9d7 jvrao                        2010-08-25  1467  		return 0;
> 8e44a0805fc9d7 jvrao                        2010-08-25  1468  	}
> 7e17225563a1d0 Jianyong Wu                  2020-09-23 @1469  	if (!atomi=
c_dec_and_test(&fid->count))
> 7e17225563a1d0 Jianyong Wu                  2020-09-23  1470  		return 0;
> 8e44a0805fc9d7 jvrao                        2010-08-25  1471  =

> 208f3c28aab706 Jim Garlick                  2012-02-26  1472  again:
> 208f3c28aab706 Jim Garlick                  2012-02-26  1473  	p9_debug(P=
9_DEBUG_9P, ">>> TCLUNK fid %d (try %d)\n", fid->fid,
> 208f3c28aab706 Jim Garlick                  2012-02-26  1474  								ret=
ries);
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1475  	err =3D 0;
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1476  	clnt =3D f=
id->clnt;
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1477  =

> 51a87c552dfd42 Eric Van Hensbergen          2008-10-16  1478  	req =3D p9=
_client_rpc(clnt, P9_TCLUNK, "d", fid->fid);
> 51a87c552dfd42 Eric Van Hensbergen          2008-10-16  1479  	if (IS_ERR=
(req)) {
> 51a87c552dfd42 Eric Van Hensbergen          2008-10-16  1480  		err =3D P=
TR_ERR(req);
> 51a87c552dfd42 Eric Van Hensbergen          2008-10-16  1481  		goto erro=
r;
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1482  	}
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1483  =

> 5d3851530d6d68 Joe Perches                  2011-11-28  1484  	p9_debug(P=
9_DEBUG_9P, "<<< RCLUNK fid %d\n", fid->fid);
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1485  =

> 43cbcbee9938b1 Tomas Bortoli                2018-08-11  1486  	p9_tag_rem=
ove(clnt, req);
> 51a87c552dfd42 Eric Van Hensbergen          2008-10-16  1487  error:
> 5034990e28efb2 Aneesh Kumar K.V             2011-07-11  1488  	/*
> 5034990e28efb2 Aneesh Kumar K.V             2011-07-11  1489  	 * Fid is =
not valid even after a failed clunk
> 208f3c28aab706 Jim Garlick                  2012-02-26  1490  	 * If inte=
rrupted, retry once then give up and
> 208f3c28aab706 Jim Garlick                  2012-02-26  1491  	 * leak fi=
d until umount.
> 5034990e28efb2 Aneesh Kumar K.V             2011-07-11  1492  	 */
> 208f3c28aab706 Jim Garlick                  2012-02-26  1493  	if (err =
=3D=3D -ERESTARTSYS) {
> 208f3c28aab706 Jim Garlick                  2012-02-26  1494  		if (retri=
es++ =3D=3D 0)
> 208f3c28aab706 Jim Garlick                  2012-02-26  1495  			goto aga=
in;
> 208f3c28aab706 Jim Garlick                  2012-02-26  1496  	} else
> 5034990e28efb2 Aneesh Kumar K.V             2011-07-11 @1497  		p9_fid_de=
stroy(fid);
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1498  	return err;
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1499  }
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1500  EXPORT_SYMB=
OL(p9_client_clunk);
> bd238fb431f319 Latchesar Ionkov             2007-07-10  1501  =

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =



> _______________________________________________
> kbuild mailing list -- kbuild(a)lists.01.org
> To unsubscribe send an email to kbuild-leave(a)lists.01.org

--===============4799510208900738976==--

