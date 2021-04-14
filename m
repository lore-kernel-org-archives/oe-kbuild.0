Content-Type: multipart/mixed; boundary="===============0368446532438199639=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [mkp-scsi:for-next 304/324] drivers/scsi/smartpqi/smartpqi_sas_transport.c:97 pqi_sas_port_add_rphy() warn: variable dereferenced before check 'pqi_sas_port->device' (see line 95)
Date: Wed, 14 Apr 2021 08:24:06 +0300
Message-ID: <20210414052406.GP6021@kadam>
In-Reply-To: <yq15z0p61kh.fsf@ca-mkp.ca.oracle.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0368446532438199639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 10:33:57PM -0400, Martin K. Petersen wrote:
> =

> Dan,
> =

> > smatch warnings:
> > drivers/scsi/smartpqi/smartpqi_sas_transport.c:97 pqi_sas_port_add_rphy=
() warn: variable dereferenced before check 'pqi_sas_port->device' (see lin=
e 95)
> =

> Microchip: This is the second time this issue has been reported.

Oops.  Sorry, that's my bad.  I didn't mean to report it twice.  I've
been catching up on email after a small vacation so my mind is a bit
scattered.

regards,
dan carpenter

--===============0368446532438199639==--

