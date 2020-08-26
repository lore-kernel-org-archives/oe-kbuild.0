Content-Type: multipart/mixed; boundary="===============2191799753836106253=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 2/3] iommu/vt-d:Add support for probing ACPI device in RMRR
Date: Wed, 26 Aug 2020 13:58:47 +0300
Message-ID: <20200826105847.GA5493@kadam>
In-Reply-To: <20200826102752.3776-3-FelixCui-oc@zhaoxin.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2191799753836106253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 06:27:51AM -0400, FelixCuioc wrote:
> After acpi device in RMRR is detected,it is necessary
> to establish a mapping for these devices.
> In acpi_device_create_direct_mappings(),create a mapping
> for the acpi device in RMRR.
> Add a helper to achieve the acpi namespace device can
> access the RMRR region.
> =

> Signed-off-by: FelixCuioc <FelixCui-oc@zhaoxin.com>
> ---
>  drivers/iommu/intel/iommu.c | 27 +++++++++++++++++++++++++++
>  drivers/iommu/iommu.c       |  6 ++++++
>  include/linux/iommu.h       |  3 +++
>  3 files changed, 36 insertions(+)
> =

> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index f774ef63d473..b31f02f41c96 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -4797,6 +4797,20 @@ static int __init platform_optin_force_iommu(void)
>  =

>  	return 1;
>  }
> +static int acpi_device_create_direct_mappings(struct device *pn_dev, str=
uct device *acpi_device)

Blank line.

> +{
> +	struct iommu_group *group;
> +
> +	acpi_device->bus->iommu_ops =3D &intel_iommu_ops;
> +	group =3D iommu_group_get(pn_dev);
> +	if (!group) {
> +		pr_warn("ACPI name space devices create direct mappings wrong!\n");
> +		return -1;

Use a proper error code.  -ENOMEM?  -EINVAL?

> +	}
> +	__acpi_device_create_direct_mappings(group, acpi_device);
> +
> +	return 0;
> +}
>  =

>  static int __init probe_acpi_namespace_devices(void)
>  {
> @@ -4812,6 +4826,7 @@ static int __init probe_acpi_namespace_devices(void)
>  			struct acpi_device_physical_node *pn;
>  			struct iommu_group *group;
>  			struct acpi_device *adev;
> +			struct device *pn_dev =3D NULL;
>  =

>  			if (dev->bus !=3D &acpi_bus_type)
>  				continue;
> @@ -4822,6 +4837,7 @@ static int __init probe_acpi_namespace_devices(void)
>  					    &adev->physical_node_list, node) {
>  				group =3D iommu_group_get(pn->dev);
>  				if (group) {
> +					pn_dev =3D pn->dev;
>  					iommu_group_put(group);
>  					continue;
>  				}
> @@ -4830,7 +4846,18 @@ static int __init probe_acpi_namespace_devices(voi=
d)
>  				ret =3D iommu_probe_device(pn->dev);
>  				if (ret)
>  					break;
> +				pn_dev =3D pn->dev;
> +			}
> +			if (pn_dev =3D=3D NULL) {

Run checkpatch.pl --strict on this patch.  Use "if (!pn_dev) {".

> +				dev->bus->iommu_ops =3D &intel_iommu_ops;
> +				ret =3D iommu_probe_device(dev);
> +				if (ret) {
> +					pr_err("acpi_device probe fail! ret:%d\n", ret);
> +					return ret;
                                        ^^^^^^^^^^
This should be goto unlock;

> +				}
> +				return 0;
                                ^^^^^^^^
>  			}
> +			ret =3D acpi_device_create_direct_mappings(pn_dev, dev);

unlock:

>  			mutex_unlock(&adev->physical_node_lock);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
regards,
dan carpenter

--===============2191799753836106253==--

