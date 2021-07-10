Content-Type: multipart/mixed; boundary="===============0895663907089226993=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/remoteproc/mtk_scp.c:570 scp_probe() warn: missing error code 'ret'
Date: Sat, 10 Jul 2021 17:49:21 +0300
Message-ID: <20210710144920.GB1931@kadam>
In-Reply-To: <202107100248.UfLmOrx6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0895663907089226993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 10, 2021 at 02:17:54AM +0800, kernel test robot wrote:
> CC: kbuild-all(a)lists.01.org
> CC: linux-kernel(a)vger.kernel.org
> TO: Alexandre Courbot <acourbot@chromium.org>
> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> CC: linux-media(a)vger.kernel.org
> =

> Hi Alexandre,
> =

> First bad commit (maybe !=3D root cause):
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   f55966571d5eb2876a11e48e798b4592fa1ffbb7
> commit: cbd2dca74926c0e4610c40923cc786b732c9e8ef remoteproc: scp: add COM=
PILE_TEST dependency
> date:   10 months ago
> :::::: branch date: 23 hours ago
> :::::: commit date: 10 months ago
> config: openrisc-randconfig-m031-20210709 (attached as .config)

Smatch seesm to completely fall apart on some of these arches.  I don't
know why...  :/  I think it's because Smatch thinks the pointers are
signed or something and that messes up parsing of PTR_ERR()?

regards,
dan carpenter

--===============0895663907089226993==--

