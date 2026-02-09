# GM Instance Utilities

## Overview

This GameMaker library contains several utility functions for working with instances.

## Requirements

- GameMaker 2022.0.3 LTS / 2024.11 Monthly or above

## Installation

- Go to [the Releases page](https://github.com/dicksonlaw583/GMInstanceUtilities/releases) to download the latest YYMPS package.
- In GameMaker, select **Tools > Import Local Package**, and select the downloaded YYMPS package.
- Import everything under `Libraries/GMInstanceUtilities`.

## Available Functions

These functions can be used to make queries on instances.

| Function | Description |
| :-- | :-- |
| `instance_all(obj, cond, [condArg])` | Returns whether all instances of a given object match a condition. |
| `instance_any(obj, cond, [condArg])` | Returns whether any instances of a given object match a condition. |
| `instance_find_all(obj, [cond], [condArg])` | Returns all instances of a given object that match a condition. |
| `instance_find_all_sorted(obj, sort, pred, [predArg], [cond], [condArg])` | Returns all instances of a given object that match a condition, sorted by a predicate function. |
| `instance_find_if(obj, cond, [condArg])` | Returns the first instance of a given object that matches a condition. |
| `instance_find_min(obj, pred, [predArg], [cond], [condArg])` | Returns the instance of a given object that matches a condition and has the minimum value according to a predicate function. |
| `instance_find_max(obj, pred, [predArg], [cond], [condArg])` | Returns the instance of a given object that matches a condition and has the maximum value according to a predicate function. |
| `instance_foreach(obj, func, [funcArg], [cond], [condArg])` | Applies a function to each instance of an object that matches a condition. |
| `instance_map(obj, pred, [predArg], [cond], [condArg])` | Returns an array of values obtained by applying a predicate function to each instance of an object that matches a condition. |
| `instance_number_if(obj, cond, [condArg])` | Returns the number of instances of a given object that match a condition. |
| `instance_sum(obj, pred, [predArg], [cond], [condArg])` | Returns the sum of values obtained by applying a predicate function to each instance of an object that matches a condition. |

## Examples

### Using `instance_all`

```gml
// If all players are dead
if (instance_all(obj_player, function(inst) { return inst.hp <= 0; })) {
    /* ... */
}
```

### Using `instance_foreach`

```gml
// Notice that the code between the braces run from the perspective of the current instance
// This is different from a with statement, which runs from the perspective of the targeted instance
instance_foreach(obj_player, function(inst) {
    instance_create_layer(x, y, layer, obj_bullet, {
        speed: 6,
        direction: point_direction(x, y, inst.x, inst.y),
    });
});
```

### Using `instance_number_if`

```gml
// Count the number of allied pets
var nAlliedPets = instance_number_if(obj_pet, function(inst, arg) { return inst.owner == arg; }, id);
```
