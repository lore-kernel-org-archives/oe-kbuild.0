Content-Type: multipart/mixed; boundary="===============0557860433000829684=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 3/3] iommu/vt-d:Add mutex_unlock() before returning
Date: Wed, 26 Aug 2020 13:59:59 +0300
Message-ID: <20200826105959.GB5493@kadam>
In-Reply-To: <20200826102752.3776-4-FelixCui-oc@zhaoxin.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0557860433000829684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 06:27:52AM -0400, FelixCuioc wrote:
> In the probe_acpi_namespace_devices function,when the physical
> node of the acpi device is NULL,the unlock function is missing.
> Add mutex_unlock(&adev->physical_node_lock).
> =

> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: FelixCuioc <FelixCui-oc@zhaoxin.com>

Oh...  Crap.  I wondered why I was being CC'd on this patchset.  Just
fold this into the ealier patch.  Don't worry about the Reported-by.

regards,
dan carpenter

--===============0557860433000829684==--

