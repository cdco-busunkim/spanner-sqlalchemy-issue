"""${message}

Revision ID: ${up_revision}
Revises: ${down_revision | comma,n}
Create Date: ${create_date}

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa
${imports if imports else ""}

# revision identifiers, used by Alembic.
revision: str = ${repr(up_revision)}
down_revision: Union[str, Sequence[str], None] = ${repr(down_revision)}
branch_labels: Union[str, Sequence[str], None] = ${repr(branch_labels)}
depends_on: Union[str, Sequence[str], None] = ${repr(depends_on)}

def apply_schema_upgrades() -> None:
    ${upgrades if upgrades else "pass"}

def apply_schema_downgrades() -> None:
    ${downgrades if downgrades else "pass"}

def upgrade() -> None:
    """Upgrade schema."""
    with op.get_context().autocommit_block():   
        apply_schema_upgrades()


def downgrade() -> None:
    """Downgrade schema."""
    with op.get_context().autocommit_block():   
        apply_schema_downgrades()      
