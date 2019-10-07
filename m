Content-Type: multipart/mixed; boundary="===============1601975484691247924=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [usb:usb-next 32/38] drivers/usb/typec/hd3ss3220.c:182 hd3ss3220_probe() warn: passing zero to 'PTR_ERR'
Date: Mon, 07 Oct 2019 17:33:10 +0300
Message-ID: <20191007143310.GK21515@kadam>
In-Reply-To: <OSBPR01MB2103FEAFF4E52D3E881179C7B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1601975484691247924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2019 at 02:19:05PM +0000, Biju Das wrote:
> OK.  Are you ok with the below changes?
> =


It will generate a compile warning so no...  :P

> @@ -178,7 +178,7 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  =

>         hd3ss3220->role_sw =3D fwnode_usb_role_switch_get(connector);
>         fwnode_handle_put(connector);
> -       if (IS_ERR_OR_NULL(hd3ss3220->role_sw))
> +       if (IS_ERR(hd3ss3220->role_sw))
>                 return PTR_ERR(hd3ss3220->role_sw);
>  =

>         hd3ss3220->typec_cap.prefer_role =3D TYPEC_NO_PREFERRED_ROLE;
> @@ -188,20 +188,22 @@ static int hd3ss3220_probe(struct i2c_client *clien=
t,
>  =

>         hd3ss3220->port =3D typec_register_port(&client->dev,
>                                               &hd3ss3220->typec_cap);
> -       if (IS_ERR(hd3ss3220->port))
> +       if (IS_ERR(hd3ss3220->port)) {
> +               usb_role_switch_put(hd3ss3220->role_sw);
>                 return PTR_ERR(hd3ss3220->port);

		ret =3D PTR_ERR(hd3ss3220->port);
		goto err_put_role

> +       }

Otherwise I think it's the right thing.  Thanks!

regards,
dan carpenter

--===============1601975484691247924==--

