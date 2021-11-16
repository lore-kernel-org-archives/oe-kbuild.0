Content-Type: multipart/mixed; boundary="===============5490856568667379904=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/net/dsa/qca8k.c:944 qca8k_parse_port_config() error: testing array offset 'cpu_port_index' after use.
Date: Tue, 16 Nov 2021 09:30:59 +0300
Message-ID: <20211116063058.GH27562@kadam>
In-Reply-To: <CA+_ehUyjDVdEe=64WbBihqSQrHeKSHx_8C3pcHctgvWy4dvnJQ@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5490856568667379904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 07:08:30PM +0100, Ansuel Smith wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git  master
> > head:   debe436e77c72fcee804fb867f275e6d31aa999c
> > commit: 5654ec78dd7e64b1e04777b24007344329e6a63b net: dsa: qca8k: rewor=
k rgmii delay logic and scan for cpu port 6
> > config: i386-randconfig-m021-20211025 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> =

> This should already be fixed by 06dd34a628ae5b6a839b757e746de165d6789ca8
> Can you confirm this?
> =


No, it doesn't fix the problem.  The check is either useless and should
be removed or there is an out of bounds bug.  Checking for an out of
bounds *after* you've already written to the memory is *never* useful.

regards,
dan carpenter

> > smatch warnings:
> > drivers/net/dsa/qca8k.c:944 qca8k_parse_port_config() error: testing ar=
ray offset 'cpu_port_index' after use.
> >
> > vim +/cpu_port_index +944 drivers/net/dsa/qca8k.c
> >
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   934  static int
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   935  qca8k_parse_port_config(s=
truct qca8k_priv *priv)
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   936  {
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   937    int port, cpu_port_inde=
x =3D 0, ret;
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   938    struct device_node *por=
t_dn;
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   939    phy_interface_t mode;
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   940    struct dsa_port *dp;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   941    u32 delay;
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   942
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   943    /* We have 2 CPU port. =
Check them */
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14  @944    for (port =3D 0; port <=
 QCA8K_NUM_PORTS && cpu_port_index < QCA8K_NUM_CPU_PORTS; port++) {
> >                                                                        =
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Assume cpu_port_index =3D QCA8K_NUM_CPU_PORTS - 1;
> >
> >
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   945            /* Skip every o=
ther port */
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   946            if (port !=3D 0=
 && port !=3D 6)
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   947                    continu=
e;
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   948
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   949            dp =3D dsa_to_p=
ort(priv->ds, port);
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   950            port_dn =3D dp-=
>dn;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   951            cpu_port_index+=
+;
> >                                                         ^^^^^^^^^^^^^^^=
^^
> > cpu_port_index is now out of bounds.
> >
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   952
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   953            if (!of_device_=
is_available(port_dn))
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   954                    continu=
e;
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   955
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   956            ret =3D of_get_=
phy_mode(port_dn, &mode);
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   957            if (ret)
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   958                    continu=
e;
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   959
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   960            switch (mode) {
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   961            case PHY_INTERF=
ACE_MODE_RGMII:
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   962            case PHY_INTERF=
ACE_MODE_RGMII_ID:
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   963            case PHY_INTERF=
ACE_MODE_RGMII_TXID:
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   964            case PHY_INTERF=
ACE_MODE_RGMII_RXID:
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   965                    delay =
=3D 0;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   966
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   967                    if (!of=
_property_read_u32(port_dn, "tx-internal-delay-ps", &delay))
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   968                           =
 /* Switch regs accept value in ns, convert ps to ns */
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   969                           =
 delay =3D delay / 1000;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   970                    else if=
 (mode =3D=3D PHY_INTERFACE_MODE_RGMII_ID ||
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   971                           =
  mode =3D=3D PHY_INTERFACE_MODE_RGMII_TXID)
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   972                           =
 delay =3D 1;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   973
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   974                    if (del=
ay > QCA8K_MAX_DELAY) {
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   975                           =
 dev_err(priv->dev, "rgmii tx delay is limited to a max value of 3ns, setti=
ng to the max value");
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   976                           =
 delay =3D 3;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   977                    }
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   978
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   979                    priv->r=
gmii_tx_delay[cpu_port_index] =3D delay;
> >                                                                 ^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Out of bounds
> >
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   980
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   981                    delay =
=3D 0;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   982
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   983                    if (!of=
_property_read_u32(port_dn, "rx-internal-delay-ps", &delay))
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   984                           =
 /* Switch regs accept value in ns, convert ps to ns */
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   985                           =
 delay =3D delay / 1000;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   986                    else if=
 (mode =3D=3D PHY_INTERFACE_MODE_RGMII_ID ||
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   987                           =
  mode =3D=3D PHY_INTERFACE_MODE_RGMII_RXID)
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   988                           =
 delay =3D 2;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   989
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   990                    if (del=
ay > QCA8K_MAX_DELAY) {
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   991                           =
 dev_err(priv->dev, "rgmii rx delay is limited to a max value of 3ns, setti=
ng to the max value");
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   992                           =
 delay =3D 3;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   993                    }
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   994
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   995                    priv->r=
gmii_rx_delay[cpu_port_index] =3D delay;
> >                                                                 ^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Out of bounds
> >
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   996
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   997                    break;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14   998            case PHY_INTERF=
ACE_MODE_SGMII:
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14   999                    if (of_=
property_read_bool(port_dn, "qca,sgmii-txclk-falling-edge"))
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14  1000                           =
 priv->sgmii_tx_clk_falling_edge =3D true;
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14  1001
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14  1002                    if (of_=
property_read_bool(port_dn, "qca,sgmii-rxclk-falling-edge"))
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14  1003                           =
 priv->sgmii_rx_clk_falling_edge =3D true;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14  1004
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14  1005                    break;
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14  1006            default:
> > 5654ec78dd7e64 Ansuel Smith 2021-10-14  1007                    continu=
e;
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14  1008            }
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14  1009    }
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14  1010
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14  1011    return 0;
> > 6c43809bf1bee7 Ansuel Smith 2021-10-14  1012  }
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

> >
--===============5490856568667379904==--

