Content-Type: multipart/mixed; boundary="===============1321794930395608134=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [gustavoars-linux:testing/fallthrough 144/560] drivers/gpu/drm/drm_dp_helper.c:492 drm_dp_downstream_max_bpc() warn: ignoring unreachable code.
Date: Tue, 07 Jul 2020 20:19:44 +0300
Message-ID: <20200707171944.GY2571@kadam>
In-Reply-To: <20200707152554.GC11125@embeddedor>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1321794930395608134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2020 at 10:25:54AM -0500, Gustavo A. R. Silva wrote:
> =

> Hi,
> =

> I think there is room for improvement here. Please, see my comments
> below...
> =

> On Tue, Jul 07, 2020 at 05:07:17PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linu=
x.git testing/fallthrough
> > head:   d7f10c2411ed9283df8d763139de9468b88c89ce
> > commit: 62708a516a6b158e213c46ff731260cb988dbc11 [144/560] drm: Use fal=
lthrough pseudo-keyword
> > config: i386-randconfig-m021-20200703 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-14) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > drivers/gpu/drm/drm_dp_helper.c:492 drm_dp_downstream_max_bpc() warn: i=
gnoring unreachable code.
> > =

> > # https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/=
commit/?id=3D62708a516a6b158e213c46ff731260cb988dbc11
> > git remote add gustavoars-linux https://git.kernel.org/pub/scm/linux/ke=
rnel/git/gustavoars/linux.git
> > git remote update gustavoars-linux
> > git checkout 62708a516a6b158e213c46ff731260cb988dbc11
> > vim +492 drivers/gpu/drm/drm_dp_helper.c
> > =

> > 7529d6af1cd16b Mika Kahola         2016-09-09  464  int drm_dp_downstre=
am_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> > 7529d6af1cd16b Mika Kahola         2016-09-09  465  			      const u8 p=
ort_cap[4])
> > 7529d6af1cd16b Mika Kahola         2016-09-09  466  {
> > 7529d6af1cd16b Mika Kahola         2016-09-09  467  	int type =3D port_=
cap[0] & DP_DS_PORT_TYPE_MASK;
> > 7529d6af1cd16b Mika Kahola         2016-09-09  468  	bool detailed_cap_=
info =3D dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> > 7529d6af1cd16b Mika Kahola         2016-09-09  469  		DP_DETAILED_CAP_I=
NFO_AVAILABLE;
> > 7529d6af1cd16b Mika Kahola         2016-09-09  470  	int bpc;
> > 7529d6af1cd16b Mika Kahola         2016-09-09  471  =

> > 7529d6af1cd16b Mika Kahola         2016-09-09  472  	if (!detailed_cap_=
info)
> > 7529d6af1cd16b Mika Kahola         2016-09-09  473  		return 0;
> > 7529d6af1cd16b Mika Kahola         2016-09-09  474  =

> > 7529d6af1cd16b Mika Kahola         2016-09-09  475  	switch (type) {
> > 7529d6af1cd16b Mika Kahola         2016-09-09  476  	case DP_DS_PORT_TY=
PE_VGA:
> > 7529d6af1cd16b Mika Kahola         2016-09-09  477  	case DP_DS_PORT_TY=
PE_DVI:
> > 7529d6af1cd16b Mika Kahola         2016-09-09  478  	case DP_DS_PORT_TY=
PE_HDMI:
> > 7529d6af1cd16b Mika Kahola         2016-09-09  479  	case DP_DS_PORT_TY=
PE_DP_DUALMODE:
> > 7529d6af1cd16b Mika Kahola         2016-09-09  480  		bpc =3D port_cap[=
2] & DP_DS_MAX_BPC_MASK;
> > 7529d6af1cd16b Mika Kahola         2016-09-09  481  =

> > 7529d6af1cd16b Mika Kahola         2016-09-09  482  		switch (bpc) {
> > 7529d6af1cd16b Mika Kahola         2016-09-09  483  		case DP_DS_8BPC:
> > 7529d6af1cd16b Mika Kahola         2016-09-09  484  			return 8;
> > 7529d6af1cd16b Mika Kahola         2016-09-09  485  		case DP_DS_10BPC:
> > 7529d6af1cd16b Mika Kahola         2016-09-09  486  			return 10;
> > 7529d6af1cd16b Mika Kahola         2016-09-09  487  		case DP_DS_12BPC:
> > 7529d6af1cd16b Mika Kahola         2016-09-09  488  			return 12;
> > 7529d6af1cd16b Mika Kahola         2016-09-09  489  		case DP_DS_16BPC:
> > 7529d6af1cd16b Mika Kahola         2016-09-09  490  			return 16;
> > 7529d6af1cd16b Mika Kahola         2016-09-09  491  		}
> > 62708a516a6b15 Gustavo A. R. Silva 2020-07-02 @492  		fallthrough;
> >                                                                 ^^^^^^^=
^^^^
> =

> Notice that the statement above and the code below is actually reachable
> if _bpc_ doesn't match any of the switch cases.

There are only 4 possible cases and all of them are handled.

# define DP_DS_MAX_BPC_MASK                 (3 << 0)

regards,
dan carpenter

--===============1321794930395608134==--

